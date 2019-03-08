import 'dart:async';
import 'package:postgres/postgres.dart';
import 'misc_lib.dart';
import 'conv_lib.dart';
import 'diff_lib.dart';
import 'permissions.dart';
import 'config_settings.dart';
import '../models/models.dart';

///centralizes access to proposal table with logic for various specific
/// proposal types
class ProposalLib {

  ///convert list of options to map of options with keys '0', '1', ...;
  /// this map format is used with proposal.options field
  static Map<String, String> _stringsToMap(List<String> options) {
    Map<String, String> optionsMap = new Map<String, String>();
    int index = 0;
    for (String optionLabel in options) optionsMap[(index++).toString()] = optionLabel;
    return optionsMap;
  }

  ///write proposal record of any kind. Caller will have to update the record
  //for some proposal types since this method doesn't write all columns.
  //options gets converted to element 0 -> key 0, etc.
  //days is converted to the current time + days.
  //Returns proposal.id
  static Future<int> _writeProposal(PostgreSQLConnection db, String kind, String eligible,
    String title, String summary, String summaryHtml, int passTarget, int failTarget,
    List<String> options, int days, String timeoutAction, int createdBy) async {

    //convert options to map
    Map<String, String> optionsMap = _stringsToMap(options);

    //calc timeout
    DateTime timeout = WLib.utcNow().add(new Duration(days: days));

    //insert
    int id = await MiscLib.queryScalar(db, 'insert into proposal(active,kind,eligible,title,summary,'
      'summary_html,pass_target,fail_target,options,timeout,timeout_action,created_at,created_by)'
      ' values(\'Y\',\'${kind}\',\'${eligible}\',@title,@sum,@sumhtml,${passTarget},${failTarget},'
      '@opt,@timeout,\'${timeoutAction}\',@now,${createdBy})'
      ' returning id',
      {'title': title, 'sum': summary, 'sumhtml': summaryHtml, 'opt': optionsMap,
      'timeout': timeout, 'now': WLib.utcNow()});
    return id;
  }

  ///write new proposal of kind NEW. colValues may contain any column name with a string
  /// or numeric value, plus it can contain this special entry: '*field_name' (value is integer
  /// number of days ahead of the current time; causes the resolved datetime to be stored in
  /// field_name)
  static Future<int> _writeNew(PostgreSQLConnection db, int createdBy, String recordDescription,
    String summary, String tableName, String keyPrefix, Map<String, dynamic> colValues) async {
    String proposalTitle = 'Determine if a new ${recordDescription} is legitimate';
    //require 1 to pass, 3 to fail
    int proposalId = await _writeProposal(db, 'NEW', 'A', proposalTitle, summary,
      null, 1, 3, _spamOptions(),
      3, 'F', createdBy);

    //write table_name, col_values, key_prefix
    await db.execute('update proposal set table_name=@t, col_values=@v, key_prefix=@kp where id=${proposalId}',
      {'t':tableName, 'v':colValues, 'kp': keyPrefix});

    return proposalId;
  }

  static List<String> _yesNoOptions() {
      return ['Yes', 'No'];
  }

  static List<String> _spamOptions() {
      return ['Legitimate', 'Spam'];
  }

  ///write proposal of kind JOIN (note caller must handle writing conv_xuser record)
  static Future proposeJoinConv(PostgreSQLConnection db, int userId, String nick, int projectId, int convId) async {
    //write proposal requiring 1 pass vote or 9 fail votes to reject;
    //timeout in a month; fail if no votes after timeout
    int proposalId = await _writeProposal(db, 'JOIN', 'L', 'Request to join project',
      'User ${nick} would like to join the project.', '', 1,
      9, _yesNoOptions(), 30, 'F', userId);
    await db.execute('update proposal set project_id=${projectId} where id=${proposalId}');
  }

  ///write proposal of kind PROJ (for arbitrary user polls), returns id
  static Future<int> proposeInProject(PostgreSQLConnection db, int userId, int projectId, String eligible,
    String title, String summary, List<String> options, int days) async {
    int proposalId = await _writeProposal(db, 'PROJ', eligible, title, summary, '', null,
      null, options, days, 'M', userId);
    await db.execute('update proposal set project_id=${projectId} where id=${proposalId}');
    return proposalId;
  }

  ///write proposal of kind NEW for a proposal of kind SYS
  static Future proposeSystemChange(ConfigSettings config, PostgreSQLConnection db, int userId,
    String changeTitle, String changeSummary, List<String> options) async {
    //put together all the values that will eventually go into the proposal
    // table for this system proposal
    int votePeriodDays = config.operation.root_doc_vote_days;
    var colValues = {
      'kind': 'SYS',
      'active': 'Y',
      'eligible': 'E',
      'title': 'System change: ${changeTitle}',
      'summary': changeSummary,
      'pass_target': config.operation.root_doc_vote_min,
      'options': _stringsToMap(options),
      '*timeout': votePeriodDays,
      'timeout_action': 'M',
      '*created_at': 0,
      'created_by': userId
    };

    //run the above record through spam control
    String spamSummary = 'Check if the following proposed system change is legitimate (not spam). Proposal is: ${changeTitle} - ${changeSummary}';
    await _writeNew(db, userId, 'proposal', spamSummary, 'proposal', 'proposal', colValues);
  }

  ///write proposal of kind NEW for a new project
  static Future proposeNewProject(PostgreSQLConnection db, int userId, String leadership,
    String privacy, String title, String description, int categoryId) async {
    var colValues = {
      'kind': 'P',
      'active': 'Y',
      'member_count': 0,
      'important_count': 0,
      'leadership': leadership,
      'privacy': privacy,
      'category_id': categoryId,
      'title': title,
      'description': description,
      '*created_at': 0
    };
    String summary = 'New project proposed: ${title}; Description: ${description}';
    await _writeNew(db, userId, 'project', summary, 'project', 'project', colValues);
  }

  ///write proposal of kind NEW for a new resource
  static Future proposeNewResource(PostgreSQLConnection db, int userId, String kind, String title,
    String description, String url, int categoryId) async {
    Map<String, dynamic> colValues = {
      'category_id': categoryId,
      'title': title,
      'description': description,
      '*created_at': 0,
      'xuser_id': userId,
      'visible': 'Y',
      'kind': kind,
      'url': url,
      'important_count': 0
    };
    String summary = 'New resource proposed: ${title}; Description: ${description}';
    int proposalId = await _writeNew(db, userId, 'resource', summary, 'resource', 'resource', colValues);
    String sumHtml = 'Preview resource here: <a target="_blank" href="${url}">${url}</a>';
    await db.execute('update proposal set summary_html=@sum where id=${proposalId}', {'sum': sumHtml});
  }

  ///write proposal of kind NEW for a new event
  static Future proposeNewEvent(PostgreSQLConnection db, int userId, String title,
    String description, DateTime startTime, String duration, double lat, double lon,
    String location) async {
    var colValues = {
      'title': title,
      'description': description,
      '@start_time': WLib.dateTimeToWire(startTime),
      'duration': duration,
      'lat': lat,
      'lon': lon,
      'location': location,
      '*created_at': 0,
      'created_by': userId
    };
    String summary = 'New event proposed: ${title}; Description: ${description}';
    await _writeNew(db, userId, 'event', summary, 'event', 'event', colValues);
  }

  ///write proposal of kind NEW for a proposal of kind ROOT;
  ///changeSummary is in the proposer's own words while changeHtml is the change proposed
  /// in html; newBody is the complete document proposed
  static Future proposeRootDocumentChange(ConfigSettings config, PostgreSQLConnection db, int userId, int docId,
    String docTitle, String changeSummary, String changeHtml, String newBody) async {

    //put together all the values that will eventually go into the proposal
    // table for this root doc amendment proposal
    int votePeriodDays = config.operation.root_doc_vote_days;
    var colValues = {
      'kind': 'ROOT',
      'active': 'Y',
      'eligible': 'E',
      'title': 'Amend document: ${docTitle}',
      'summary': changeSummary,
      'summary_html': changeHtml,
      'dtext': newBody,
      'pass_target': config.operation.root_doc_vote_min,
      'options': _stringsToMap(_yesNoOptions()),
      '*timeout': votePeriodDays,
      'timeout_action': 'M',
      '*created_at': 0,
      'created_by': userId,
      'doc_id': docId
    };

    //run the above record through spam control
    String spamSummary = 'Check if the following proposed document edits are legitimate. Proposal is: ${changeSummary}';
    int spamId = await _writeNew(db, userId, 'proposal', spamSummary, 'proposal', 'proposal', colValues);
    await db.execute('update proposal set summary_html=@h where id=${spamId}', {'h': changeHtml});
  }

  //determine if a user is eligible to vote on a project; may load a db record
  /// to determine this. proposalRow must contain created_by, eligible and project_id columns
  /// at least.
  static Future<bool> isEligibleToVote(PostgreSQLConnection db, int userId, bool isSiteAdmin,
    Row proposalRow) async {
    String eligibleCode = proposalRow.eligible;
    if (eligibleCode == 'E') return true; //everyone
    else if (eligibleCode == 'A') {
      //is only for site admins; for spam control don't allow user to pass their
      // own new thing
      if (!isSiteAdmin) return false;
      if (proposalRow.kind == 'NEW' && proposalRow.created_by == userId) return false;
      return true;
    }
    else {
      //is based on project, so load user's membership in project
      int projectId = proposalRow.project_id;
      if (projectId == null) return false;
      String pkind = await MiscLib.queryScalar(db, 'select kind from project_xuser where project_id=${projectId} and xuser_id=${userId}');
      if (eligibleCode == 'L') { //leader
        return pkind == 'M';
      }
      if (eligibleCode == 'P') { //proj member
        return pkind == 'O' || pkind == 'V' || pkind == 'A' || pkind == 'M';
      }
    }
    return false;
  }

  ///cast a vote; caller is responsible for calling isEligibleToVote first;
  /// optionNo can be null to un-vote
  static Future vote(PostgreSQLConnection db, int proposalId, int userId, int optionNo) async {
    //check proposal exists
    Row proposalRow = await MiscLib.querySingle(db, 'select timeout,active,timeout_action,pass_target,fail_target from proposal where id=${proposalId}');
    if (proposalRow == null) {
      //for spam control just ignore it (there's a high chance it won't exist in that case)
      return;
      //was: throw new Exception('Proposal does not exist');
      //note we have no way to know if the proposal was for spam or not
    }

    //error if proposal is no longer active
    DateTime timeout = proposalRow.timeout;
    if (proposalRow.active != 'Y' || timeout.isBefore(WLib.utcNow())) throw new Exception('This proposal has closed; vote not recorded.');

    //cast or uncast vote
    if (optionNo == null) {
      await db.execute('delete from proposal_xuser where proposal_id=${proposalId} and xuser_id=${userId}');
    } else {
      int count = await db.execute('update proposal_xuser set vote=${optionNo} where proposal_id=${proposalId} and xuser_id=${userId}');
      if (count == 0) {
        await db.execute('insert into proposal_xuser(proposal_id,xuser_id,vote)values(${proposalId},${userId},${optionNo})');
      }
    }

    //if this vote caused the total to exceed the pass or fail target, then
    // close the proposal, fasttrack mode only
    if (proposalRow.timeout_action == 'F') {
      if (optionNo == 0 && proposalRow.pass_target != null) {
        //check if this Yes vote reaches the pass target
        int count = await MiscLib.queryScalar(db, 'select count(*) from proposal_xuser where proposal_id=${proposalId} and vote=0');
        if (count >= proposalRow.pass_target) await closeProposal(db, proposalId);
      }
      if (optionNo == 1 && proposalRow.fail_target != null) {
        //check if this No vote reaches the fail target
        int count = await MiscLib.queryScalar(db, 'select count(*) from proposal_xuser where proposal_id=${proposalId} and vote=1');
        if (count >= proposalRow.fail_target) await closeProposal(db, proposalId);
      }
    }
  }

  ///tally votes; close proposal; see in line comments for specific steps for each proposal type;
  /// this is called either from vote() to close early, or from worker to close after
  /// the timeout
  static Future closeProposal(PostgreSQLConnection db, int proposalId) async {
    //tally votes
    List<Row> sumRows = await db.query('select vote,count(vote) as c from proposal_xuser where proposal_id=${proposalId} group by vote').toList();
    Map<String, int> voteCounts = new Map<String, int>(); //counts indexed by (option#.tostring)
    for (Row sumRow in sumRows) {
      String option = sumRow[0].toString();
      int count = sumRow[1];
      voteCounts[option] = count;
    }

    //get proposal info; if already closed, exit
    //Note that many of the retrieved cols are needed by the _finalize* methods
    Row proposalRow = await MiscLib.querySingleChecked(db, 'select active,kind,title,pass_target,fail_target,timeout_action,timeout,table_name,options,col_values,key_prefix,project_id,doc_id,created_by,dtext from proposal where id=${proposalId}',
      'Proposal does not exist');
    if (proposalRow.active == 'N') return;

    //determine what action to take based on results
    int yesCount = voteCounts.containsKey('0') ? voteCounts['0'] : 0;
    bool hasPassTarget = proposalRow.pass_target != null;
    bool passTargetReached = hasPassTarget && yesCount >= proposalRow.pass_target;
    int noCount = voteCounts.containsKey('1') ? voteCounts['1'] : 0;
    bool failTargetReached = proposalRow.fail_target != null && noCount >= proposalRow.fail_target;
    //bool timedOut = WLib.utcNow().isAfter(proposalRow.timeout);
    String timeoutAction = proposalRow.timeout_action;
    int winOption = null;
    if (timeoutAction == 'F') { //fast track (proposal closed early if either target reached)
      if (passTargetReached) winOption = 0;
      else winOption = 1; //else if fail target reached or neither target reached, then fail
    }
    else if (timeoutAction == '0') { //autopass (unless fail target reached)
      if (failTargetReached) winOption = 1;
      else winOption = 0;
    }
    else if (timeoutAction == '1') { //autofail (unless pass target reached)
      if (passTargetReached) winOption = 0;
      else winOption = 1;
    }
    else if (timeoutAction == 'M') { //majority
      int maxOption, maxCount;
      voteCounts.forEach((opt, count) {
        if (maxCount == null || count > maxCount) {
          maxOption = int.parse(opt);
          maxCount = count;
        }
      });
      winOption = maxOption ?? 1;

      //even with majority proposal, passtarget (if defined) must be reached
      if (hasPassTarget && !passTargetReached && winOption == 0) winOption = 1;
    }
    else winOption = 1; //should not happen

    //close it and record results
    await db.execute('update proposal set active=\'N\',vote_counts=@counts,winning_option=${winOption} where id=${proposalId}',
      {'counts': voteCounts});
    await delete(db, proposalId, false);

    //specific actions by proposal type
    String kind = proposalRow.kind;
    if (kind == 'NEW') await _finalizeKindNew(db, proposalId, proposalRow, winOption);
    else if (kind == 'JOIN') await _finalizeKindJoin(db, proposalId, proposalRow, winOption);
    else if (kind == 'SYS') await _finalizeKindSys(db, proposalRow, winOption);
    else if (kind == 'PROJ') await _finalizeKindProj(db, proposalId, proposalRow, winOption);
    else if (kind == 'ROOT') await _finalizeKindRoot(db, proposalId, proposalRow, winOption);
  }

  ///delete the proposal votes, and optionally the header (that is, the proposal row)
  static Future delete(PostgreSQLConnection db, int proposalId, bool deleteHeader) async {
    await db.execute('delete from proposal_xuser where proposal_id=${proposalId}');
    if (deleteHeader)
      await db.execute('delete from proposal where id=${proposalId}');
  }

  ///perform follow up actions for closed proposals of kind=NEW;
  /// there are a few hacks to this based on the type of thing being created,
  /// as marked by 'special cases' in-line
  static Future _finalizeKindNew(PostgreSQLConnection db, int proposalId, Row proposalRow, int winOption) async {
    //create a colValues map that undoes the magic column names (see datase doc)
    Map<String, dynamic> colValuesWithMagic = proposalRow.col_values;
    Map<String, dynamic> colValues = new Map<String, dynamic>();
    colValuesWithMagic.forEach((colName, value) {
      if (colName.startsWith('*')) {
        String resolvedColName = colName.substring(1);
        DateTime resolvedValue = WLib.utcNow().add(new Duration(days: value)); //convert int to that many days ahead
        colValues[resolvedColName] = resolvedValue;
      } else if (colName.startsWith('@')) {
        String resolvedColName = colName.substring(1);
        DateTime resolvedValue = WLib.wireToDateTime(value);
        colValues[resolvedColName] = resolvedValue;
      } else
        colValues[colName] = value;
    });

    //convert col_values to fragments of an insert statement
    String tableName = proposalRow.table_name;
    String keyPrefix = proposalRow.key_prefix ?? '';
    StringBuffer sqlColNames = new StringBuffer(), sqlColPlaceholders = new StringBuffer();
    bool first = true;
    if (colValues != null) {
      colValues.forEach((colName, value) {
        if (!first) { sqlColNames.write(','); sqlColPlaceholders.write(','); }
        first = false;
        sqlColNames.write(colName);
        sqlColPlaceholders.write('@');
        sqlColPlaceholders.write(colName);
      });
    }

    //if proposal passed, check if creation allowed and create the record
    int createdRecordId;
    String creationImpossibleMessage;
    if (winOption == 0 && sqlColNames.length > 0) {
      creationImpossibleMessage = await _allowNewRecord(db, tableName, colValues);
      if (creationImpossibleMessage == null) //ok
        createdRecordId = await MiscLib.queryScalar(db, 'insert into ${tableName}(${sqlColNames})values(${sqlColPlaceholders}) returning id', colValues);
    }

    //delete proposal
    await delete(db, proposalId, true);

    //figure out the 'title' of the thing created, which is usually the title
    // column of the newly created record (such as project.title); but fall back
    // to the proposal title
    String title = proposalRow.title;
    if (colValues.containsKey('title')) title = colValues['title'];

    //notify creator
    int createdBy = proposalRow.created_by; //a user id
    if (createdRecordId != null) { //a rec was created
      String body = 'Spam checking has been completed successfully on this request: ${title}';
      await MiscLib.notify(db, createdBy, body, linkKey: keyPrefix + '/' + createdRecordId.toString(), linkText: 'Open it');
    } else { //failed
      String body = 'Some admins thought that your request was spam, so no action was taken on this request: ${title}';
      if (creationImpossibleMessage != null)
        body = 'There was a problem with an edit you made. ${creationImpossibleMessage} (Proposal was: ${title})';
      await MiscLib.notify(db, createdBy, body);
    }

    //special cases
    if (tableName == 'project') await _fixUpNewProject(db, createdRecordId, createdBy);
  }

  ///check if a new record is allowed; currently only checks special cases for
  /// these types: root doc proposal.
  /// Returns null if ok, else an error message
  static Future<String> _allowNewRecord(PostgreSQLConnection db, String tableName, Map<String, dynamic> colValues) async {
    //for root doc proposals, don't allow it if another voting period is in
    // progress
    if (tableName == 'proposal' && colValues['kind'] == 'ROOT') {
      int docId = colValues['doc_id'];
      Row existingProposalRow = await MiscLib.querySingle(db, 'select id from proposal where kind=\'ROOT\' and active=\'Y\' and doc_id=${docId}');
      if (existingProposalRow != null)
        return 'Two proposals to change the same document were submitted near the same time, so this one can no longer be processed. You can try your edits again after the other proposal has completed.';
    }

    return null;
  }

  ///perform follow up actions after a project record was created via _finalizeKindNew
  static Future _fixUpNewProject(PostgreSQLConnection db, int projectId, int userId) async {
    //write the person who created the project as a member of it
    if (projectId != null) {
      await db.execute(
          'insert into project_xuser(project_id,xuser_id,kind,spam_count)'
              'values(${projectId},${userId},\'M\',0)');
    }
  }

  ///perform follow up actions for closed proposals of kind=JOIN
  static Future _finalizeKindJoin(Connection db, int proposalId, Row proposalRow, int winOption) async {
    //join conversation(s)
    int projectId = proposalRow.project_id;
    int createdBy = proposalRow.created_by; //a user id
    int numJoined = 0;
    if (winOption == 0 && projectId != null) {
      List<Row> convUserRows = await db.query('select conv_xuser.conv_id,conv_xuser.status from conv_xuser inner join conv on conv_xuser.conv_id=conv.id where conv.project_id=${projectId} and conv_xuser.xuser_id=${createdBy}').toList();
      for (Row convUserRow in convUserRows) {
        if (convUserRow[1] == 'A') { //found a conv that the user requested to join
          int convId = convUserRow[0];
          JoinInfo permissions = await Permissions.getConvJoinPermissions(db, createdBy, convId);
          await ConvLib.join(db, createdBy, convId, permissions);
          ++numJoined;

          //notify join successful
          await MiscLib.notify(db, createdBy, 'Your request to join a private conversation was accepted.',
            //linkKey: 'project/${projectId}', linkText: 'Go to project');
            linkKey: 'conv/${convId}', linkText: 'Go to conversation');
        }
      }
    }

    //notify if nothing joined
    if (numJoined == 0)
      await MiscLib.notify(db, createdBy, 'Your request to join a private conversation was not accepted.');

    await delete(db, proposalId, true);
  }

  ///perform follow up actions for closed proposals of kind=SYS
  static Future _finalizeKindSys(Connection db, Row proposalRow, int winOption) async {
    //notify ALL users of the results
    String title = proposalRow.title;
    String body = winOption == 0 ? 'The following system proposal has passed and should be implemented: ${title}'
      : 'The following system proposal did not get enough votes to pass: ${title}';
    List<int> userIds = await MiscLib.getAllUserIds(db);
    for (int userId in userIds)
      await MiscLib.notify(db, userId, body);
  }

  ///perform follow up actions for closed proposals of kind=PROJ
  static Future _finalizeKindProj(Connection db, int proposalId, Row proposalRow, int winOption) async {
    //get the results in readable form
    String title = proposalRow.title;
    Map options = proposalRow.options;
    String winOptionS = winOption.toString();
    String winOptionText = options.containsKey(winOptionS) ? options[winOptionS] : 'Unknown';
    String body = 'A project poll has completed and is now closed. The winning option is "${winOptionText}". Poll: ${title}';

    //notify all users joined to the project of the results
    int projectId = proposalRow.project_id;
    List<Row> projUserRows = await db.query('select xuser_id from project_xuser where project_id=${projectId} and kind in (\'V\',\'A\',\'M\')').toList();
    for (Row projUserRow in projUserRows) {
      await MiscLib.notify(db, projUserRow[0], body, linkKey: 'project/${projectId}', linkText: 'Go to project');
    }

    //set delete date
    await db.execute('update proposal set delete_time=@d where id=${proposalId}',
      {'d': WLib.utcNow().add(new Duration(days:180))});
  }

  ///perform follow up actions for closed proposals of kind=ROOT
  static Future _finalizeKindRoot(Connection db, int proposalId, Row proposalRow, int winOption) async {
    //make a new document revision
    int docId = proposalRow.doc_id;
    String dtext = proposalRow.dtext; //new complete doc
    if (winOption == 0) {
      String docTitle = await MiscLib.queryScalar(db, 'select title from doc where id=${docId}');
      await DiffLib.reviseDocument(db, docId, docTitle, dtext, proposalId, null);
    }

    //notify ALL users of the results
    String title = proposalRow.title;
    String body = winOption == 0 ? 'The following document has been modified. A proposal was made and the majority of users voted in favor of the change. Proposal: ${title}'
      : 'A proposal to modify a document did not get enough votes to pass, so it was not changed: ${title}';
    String link = 'doc/${docId}';
    List<int> userIds = await MiscLib.getAllUserIds(db);
    for (int userId in userIds)
      await MiscLib.notify(db, userId, body, linkKey: link, linkText: 'Open document');
  }


}
