import 'dart:async';
import 'package:postgresql/postgresql.dart';
//import 'misc_lib.dart';
//import 'date_lib.dart';
import 'image_lib.dart';

///static methods to delete records with cascading
class CleanDeleter {

  ///delete a post (with its image and child records)
  static Future deletePost(Connection db, String postId) async {
    //delete image
    await ImageLib.deletePostImage(postId);

    //cascade to child tables
    await db.execute('delete from conv_post_xuser where conv_post_id=@i', {'i': postId});

    //delete row
    await db.execute('delete from conv_post where id=@i', {'i': postId});
  }

  ///delete a conversation (with images and all child records)
  static Future deleteConv(Connection db, int id) async {
    //delete images

    //cascade to child tables
    await db.execute('delete from conv_post_xuser where conv_post_id in(select id from conv_post where conv_id=${id})');
    await db.execute('delete from conv_post where conv_id=${id}');
    await db.execute('delete from conv_xuser where conv_id=${id}');

    //delete row
    await db.execute('delete from conv where id=${id}');
  }

  ///delete an event and its conversations
  static Future deleteEvent(Connection db, int eventId) async {
    //delete convs
    List<Row> convRows = await db.query('select id from conv where event_id=${eventId}').toList();
    for (Row convRow in convRows) await deleteConv(db, convRow.id);

    //delete event child tables
    await db.execute('delete from event_xuser where event_id=${eventId}');

    //delete row
    await db.execute('delete from event where id=${eventId}');
  }

  ///inactivate a user and unlink or delete child records
  static Future deleteUser(Connection db, int userId) async {
    //set inactive
    await db.execute('update xuser set status=\'D\' where id=${userId}');

    //delete events
    List<Row> eventRows = await db.query('select id from event where created_by=${userId}').toList();
    for (Row eventRow in eventRows) deleteEvent(db, eventRow[0]);

    //unlink resources
    await db.execute('update resource set xuser_id=null where xuser_id=${userId}');

    //cascade to child tables (note some of these are not indexed on user id!)
    await db.execute('delete from xuser_notify where xuser_id=${userId}');
    await db.execute('delete from xuser_xuser where owner_id=${userId}');
    await db.execute('delete from xuser_xuser where about_id=${userId}');
    await db.execute('delete from resource_xuser where xuser_id=${userId}');
    await db.execute('delete from conv_xuser where xuser_id=${userId}');
    await db.execute('delete from conv_post_xuser where xuser_id=${userId}');
    await db.execute('delete from project_xuser where xuser_id=${userId}');
    await db.execute('delete from project_xuser_xuser where owner_id=${userId}');
    await db.execute('delete from project_xuser_xuser where about_id=${userId}');
    await db.execute('delete from proposal_xuser where xuser_id=${userId}'); //this won't change the outcome if proposal is closed
  }

  ///delete a resource with child records
  static Future deleteResource(Connection db, int resourceId) async {
    //cascade to child tables
    await db.execute('delete from resource_xuser where resource_id=${resourceId}');

    //delete row
    await db.execute('delete from resource where id=${resourceId}');
  }

  ///delete a project and its documents only (does NOT delete convs or proposals, so if
  /// those records exist, this will fail)
  static Future deleteProjectPartial(Connection db, int projectId) async {
    //note this could fail if there is a stray proposal pointing to the doc to be deleted,
    //so ignore errors on those tables

    //cascade to child tables
    await db.execute('delete from project_xuser_xuser where project_id=${projectId}');
    await db.execute('delete from project_xuser where project_id=${projectId}');
    try {
      await db.execute(
          'delete from doc_revision where doc_id in (select id from doc where project_id=${projectId})');
      await db.execute('delete from doc where project_id=${projectId}');

      //delete row
      await db.execute('delete from project where id=${projectId}');
    } catch (ex) {}
  }
}
