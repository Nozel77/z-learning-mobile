import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:z_learning/service/learning_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'favorites.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY, title TEXT, instructor TEXT, price INTEGER, rating TEXT, images TEXT, lessons TEXT, duration TEXT, description TEXT, created_at TEXT, updated_at TEXT)',
        );
      },
    );
  }

  Future<int> insertFavorite(Learning favorite) async {
    Database db = await database;
    return await db.insert('favorites', favorite.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Learning>> getFavorites() async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query('favorites');
    return result.map((map) => Learning.fromMap(map)).toList();
  }

  Future<int> deleteFavorite(int id) async {
    Database db = await database;
    return await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }
}
