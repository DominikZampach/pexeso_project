import 'dart:io';

import 'package:sqflite/sqflite.dart';

Future<bool> doesDbAlreadyExist() async {
  var databasesPath = await getDatabasesPath();
  String dbPath = "$databasesPath/score.db";
  print("DB path: $dbPath");
  return await File(dbPath).exists();
}

void createDb() async {
  if (await doesDbAlreadyExist()) {
    print("Database already created");
    return;
  }
  var databasesPath = await getDatabasesPath();
  String dbPath = "$databasesPath/score.db";
  Database database = await openDatabase(
    dbPath,
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE scores(id INTEGER PRIMARY KEY, attempts INTEGER, difficulty INTEGER, timemilisecond INTEGER)");
      print("Database created");
    },
  );
  await database.close();
}

void saveToDatabase(int attempts, int difficulty, int timemilisecond) async {
  var databasesPath = await getDatabasesPath();
  String dbPath = "$databasesPath/score.db";
  Database database = await openDatabase(dbPath);
  await database.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO scores(attempts, difficulty, timemilisecond) VALUES (?, ?, ?)',
        [attempts, difficulty, timemilisecond]);
    print("Inserted $id1");
  });
}
