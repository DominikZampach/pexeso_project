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

Future<List<Map>> getSpecificDifficultyRecords(int difficulty) async {
  var databasesPath = await getDatabasesPath();
  String dbPath = "$databasesPath/score.db";
  Database database = await openDatabase(dbPath);
  List<Map> records = await database.rawQuery(
      "SELECT * FROM scores WHERE difficulty=$difficulty ORDER BY timemilisecond");
  print(records);
  // Output:  [{id: 1, attempts: 9, difficulty: 1, timemilisecond: 17488}, {id: 2, attempts: 10, difficulty: 1, timemilisecond: 18734}, {id: 3, attempts: 14, difficulty: 1, timemilisecond: 41583}, {id: 4, attempts: 9, difficulty: 1, timemilisecond: 25287}, {id: 5, attempts: 11, difficulty: 1, timemilisecond: 19152}]
  return records;
}
