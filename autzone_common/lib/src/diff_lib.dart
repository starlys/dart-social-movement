import "dart:async";
import "dart:convert";
import 'package:diff_match_patch/diff_match_patch.dart';
import 'package:postgres/postgres.dart';
import 'package:autzone_models/autzone_models.dart';
import 'misc_lib.dart';

///structure to store 2 versions of a doc
class DocDiffInfo {
  String before, after;
  int beforeRevNo, afterRevNo;
  DateTime beforeCreatedAt, afterCreatedAt;
  int beforeProposalId;
}

///handles file diffs for the document features
class DiffLib {

  ///get any revision of a given document; pass revisionNo=null for latest
  static Future<String> getDocument(PostgreSQLConnection db, int id, int revisionNo) async {
    DocDiffInfo info = await load(db, id, revisionNo, false);
    return info.after;
  }

  ///build change-review text in HTML with highlighted changes from the
  /// prior version to the given version of the document
  static Future<String> getDiffHtml(PostgreSQLConnection db, int id, int revisionNo) async {
    DocDiffInfo info = await load(db, id, revisionNo, true);
    String before = info.before ?? '';
    String after = info.after ?? '';
    return buildReviewHtml(before, after);
  }

  ///build a change-review text in HTML with highlighted changes from the
  /// before and after versions of a document
  static String buildReviewHtml(String before, String after) {
    List<Diff> diffs = diff(before, after, timeout: 2.0);
    StringBuffer html = new StringBuffer();
    HtmlEscape encoder = new HtmlEscape();
    for (Diff d in diffs) {
      String chunk = encoder.convert(d.text);
      if (d.operation == DIFF_EQUAL) {
        int dtextlen = d.text.length;
        if (dtextlen > 80) {
          html.write(encoder.convert(d.text.substring(0, 40)));
          html.write('...<hr/>...');
          html.write(encoder.convert(d.text.substring(dtextlen - 40, dtextlen)));
        } else
          html.write(chunk);
      }
      else if (d.operation == DIFF_DELETE) {
        html.write('<span style="text-decoration:line-through">${chunk}</span>');
      }
      if (d.operation == DIFF_INSERT) {
        html.write('<span style="text-decoration:underline">${chunk}</span>');
      }
    }
    return html.toString().replaceAll('\r\n', '<br/>');
  }

  ///save a new document; returns doc id
  static Future<int> saveNewDocument(PostgreSQLConnection db, int projectId, String title, String body) async {
    int id = await MiscLib.queryScalar(db, 'insert into doc(project_id,title,body,revision_no,created_at)'
      'values(${projectId},@t,@b,1,@d) returning id',
      {'t': title, 'b': body, 'd': WLib.utcNow()});
    return id;
  }

  ///save an update to a document - writes new doc_revision record and updates doc record;
  /// proposalId can be null; if whereProjectId is nonnull it is used in the where clause only
  static Future reviseDocument(PostgreSQLConnection db, int id, String title, String body, int proposalId,
    int whereProjectId) async {
    //get currently committed version ("prior")
    DocDiffInfo info = await load(db, id, null, false);
    String priorBody = info.after;
    int priorRevNo = info.afterRevNo;
    int newRevNo = priorRevNo + 1;

    //get backwards diff: the patch is what you would apply to the newly saved
    // body to rebuild the prior body
    String patch = makePatch(body, priorBody);

    await db.transaction((ctx) async {
      //update doc record
      String whereClause3 = whereProjectId == null ? '' : ' and project_id=${whereProjectId}';
      int count = await ctx.execute('update doc set title=@t,body=@b,revision_no=${newRevNo},created_at=@d'
        ' where id=${id} and revision_no=${priorRevNo} ${whereClause3}',
        substitutionValues: {'t':title, 'b':body, 'd':WLib.utcNow()});
      if (count < 1) throw new Exception('Could not update document because another user updated it at the same time.');

      //add rev record
      count = await ctx.execute('insert into doc_revision(doc_id,revision_no,diff,created_at,proposal_id)'
        ' values(${id},${priorRevNo},@b,@d,@prop)',
        substitutionValues: {'b': patch, 'd': info.afterCreatedAt, 'prop': proposalId});
      if (count < 1) throw new Exception('Could not save document revision because another user updated it at the same time.');
    });
  }

  ///undo a document revision, restoring its previous state; revisionNo
  /// should match the current revision_no and is used to check for simultaneous
  /// rollbacks
  static Future unreviseDocument(PostgreSQLConnection db, int id, int revisionNo) async {
    //get things from current latest version & the one before that;
    //info.after* is from the doc record; info.before* is from the latest doc_revision
    DocDiffInfo info = await load(db, id, null, true);
    if (info.afterRevNo != revisionNo) throw new Exception('You can only roll back the latest version.');

    await db.transaction((ctx) async {
      //delete revision
      int count = await db.execute('delete from doc_revision where doc_id=${id} and revision_no=${info.beforeRevNo}');
      if (count < 1) throw new Exception('Could not delete document revision because another user deleted it at the same time.');

      //rollback doc
      count = await ctx.execute('update doc set body=@b,revision_no=${info.beforeRevNo},created_at=@d'
        ' where id=${id} and revision_no=${info.afterRevNo}',
        substitutionValues: {'b':info.before, 'd':info.beforeCreatedAt});
      if (count < 1) throw new Exception('Could not roll back document because another user updated it at the same time.');
    });
  }

  ///build a patch string which is the condensed information needed to
  /// convert from before to after. The format is a sequence of delete,
  /// insert or equality commands. Each command is in the format
  /// "=123" keep 123 chars from before in the result
  /// "-123" delete 123 chars from before
  /// "+ABCDEF|" append ABCDEF to the result, where ABCDEF may contain 2 escape sequences
  /// (\\ indicates \, \| indicates |)
  static String makePatch(String before, String after) {
    List<Diff> diffs = diff(before, after, timeout: 2.0);
    cleanupEfficiency(diffs, 20);

    ///escape the string, only handling backslash and pipe chars
    String escape(String s) {
      int slen = s.length;
      StringBuffer ret = new StringBuffer();
      for (int i = 0; i < slen; ++i) {
        String c = s[i];
        if (c == r'\') ret.write(r'\\');
        else if (c == '|') ret.write(r'\|');
        else ret.write(c);
      }
      return ret.toString();
    }

    StringBuffer patch = new StringBuffer();
    for (Diff d in diffs) {
      if (d.operation == DIFF_EQUAL) {
        patch.write('=');
        patch.write(d.text.length);
      }
      else if (d.operation == DIFF_DELETE) {
        patch.write('-');
        patch.write(d.text.length);
      }
      if (d.operation == DIFF_INSERT) {
        patch.write('+');
        patch.write(escape(d.text));
        patch.write('|');
      }
    }
    return patch.toString();
  }

  ///apply a patch created by makePatch to the before string to yield
  /// the original after string
  static String applyPatch(String before, String patch) {
    int p = 0; //pos of next token in patch
    int b = 0; //pos of next token in before
    int patchLen = patch.length;
    StringBuffer after = new StringBuffer();
    int zeroCode = '0'.codeUnitAt(0); //the unicode value of '0'

    //read an int from patch; advance p
    int readInt() {
      int i = 0;
      while (p < patchLen) {
        int digit = patch.codeUnitAt(p) - zeroCode;
        if (digit < 0 || digit > 9) return i;
        i *= 10;
        i += digit;
        ++p;
      }
      return i; //end of input
    }

    //read a string from patch and unescape it; avance p
    String readString() {
      StringBuffer ret = new StringBuffer();
      while (true) {
        String c = patch[p++];
        if (c == '|') break; //terminator
        if (c == r'\') c = patch[p++]; //unescape
        ret.write(c);
      }
      return ret.toString();
    }

    //parsing loop
    while (p < patchLen) {
      String command = patch[p++];
      if (command == '=') {
        int count = readInt();
        String sameText = before.substring(b, b + count);
        b += count;
        after.write(sameText);
      } else if (command == '-') {
        int count = readInt();
        b += count;
      } else if (command == '+') {
        String insertText = readString();
        after.write(insertText);
      } else
        throw new Exception('Incorrect patch syntax: expecting +, -, =');
    }

    return after.toString();
  }

  ///load the given revision of a document into the 'after' of the return structure;
  /// if alsoLoadPrior is true, then also load the version before that into 'before';
  /// pass reqRevisionNo=null for latest;
  /// if there are no prior revisions, beforeRevNo will be null
  static Future<DocDiffInfo> load(PostgreSQLConnection db, int id, int reqRevisionNo, bool alsoLoadPrior) async {
    DocDiffInfo info = new DocDiffInfo();

    //get latest; return it if this is the requested revision
    final docRow = await MiscLib.queryRowChecked(db, 'select body,revision_no,created_at from doc where id=${id}', 'Document does not exist', null);
    String body = docRow['body'];
    int rev = docRow['revision_no'];
    if (reqRevisionNo == null) reqRevisionNo = rev;
    info.afterRevNo = rev;
    if (rev == reqRevisionNo) {
      info.after = body;
      info.afterRevNo = rev;
      info.afterCreatedAt = docRow['created_at'];
      if(!alsoLoadPrior) return info;
    }
    if (reqRevisionNo > rev) throw new Exception('Requested revision is greater than the current revision');

    //loop old revs backwards and apply patches
    int loadThrough = alsoLoadPrior ? reqRevisionNo - 1 : reqRevisionNo;
    final revRows = await MiscLib.query(db, 'select revision_no,diff,created_at,proposal_id from doc_revision where doc_id=${id} and revision_no>=${loadThrough} order by revision_no desc', null);
    for (final revRow in revRows) {
      if (--rev != revRow['revision_no']) throw new Exception('Database corruption: missing or duplicate doc_revision record for id ${id}');
      body = applyPatch(body, revRow['diff']);
      if (rev == reqRevisionNo) {
        info.after = body;
        info.afterRevNo = rev;
        info.afterCreatedAt = revRow['created_at'];
      }
      if (alsoLoadPrior && rev == reqRevisionNo - 1) {
        info.before = body;
        info.beforeRevNo = rev;
        info.beforeCreatedAt = revRow['created_at'];
        info.beforeProposalId = revRow['proposal_id'];
      }
    }
    return info;
  }

}
