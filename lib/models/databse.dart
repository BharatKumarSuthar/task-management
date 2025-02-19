import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper getInstanace = DBHelper._();
  static final String TABLE_NAME = "tasks";
  static final String TITLE = "title";
  static final String DESC = "desc";
  static final String STATUS = "status";
  static final String S_NO = "s_no";
  static final String CREATED_DATE = "createdDate";
  static final String COMPLETED_DATE = "completedDate";

  //db opening and creation
  Database? db;
  Future<Database> getDB() async {
    if (db != null) {
      return db!;
    } else {
      db = await openDB();
      return db!;
    }
  }

  Future<Database> openDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String dbPath = join(dir.path, "task.db");
    return await openDatabase(dbPath, onCreate: (db, version) {
      db.execute(
          "create table $TABLE_NAME ($S_NO integer primary key autoincrement,$TITLE text,$DESC text,$STATUS text)");
    }, version: 1);
  }

  Future<bool> addTask(
      {required String title,
      required String desc,
      required String status}) async {
    var db = await getDB();
    int rowsAffected =
        await db.insert(TABLE_NAME, {TITLE: title, DESC: desc, STATUS: status});
    return rowsAffected > 0;
  }

  Future<List<Map<String, dynamic>>> getAllTasks() async {
    var db = await getDB();
    List<Map<String, dynamic>> data = await db.query(TABLE_NAME);
    return data;
  }

  Future<bool> updateTask(
      {required String title, required String desc, required int sno}) async {
    var db = await getDB();
    int rowsEffected = await db.update(
        TABLE_NAME,
        {
          TITLE: title,
          DESC: desc,
        },
        where: "$S_NO = $sno");
    return rowsEffected > 0;
  }

  Future<bool> deleteTask({required int sno}) async {
    var db = await getDB();
    int rowsEffected = await db.delete(TABLE_NAME, where: "$S_NO = $sno");
    return rowsEffected > 0;
  }
}
