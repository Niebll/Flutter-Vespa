import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'cart_vespa.dart';


class VespaDatabase {
  static final VespaDatabase instance = VespaDatabase.init();

  static Database? _database;

  VespaDatabase.init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('football.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // create database
  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final intType = "INTEGER NOT NULL";

    // creating table
    await db.execute('''
    CREATE TABLE ${VespaClass.favorite_team}(
    ${VespaClass.id} $idType,
    ${VespaClass.title} $textType,
    ${VespaClass.imgthumbnail} $textType,
    ${VespaClass.harga} $textType,
    ${VespaClass.primaryColor} $textType
    )
    ''');
  }

  // add data into dqatabase
  Future<int> create(VespaCart model) async {
    Database db = await instance.database;
    final query = await db.insert(VespaClass.favorite_team, model.toMap());

    return query;
  }

  // to read and dsiplay the data from database
  Future<List<VespaCart>> readAll() async {
    Database db = await instance.database;

    final data = await db.query(VespaClass.favorite_team);
    List<VespaCart> result = data.map((e) => VespaCart.fromMap(e)).toList();

    return result;
  }

  Future<bool> read(String? title) async {
    final db = await instance.database;

    final maps = await db.query(
      VespaClass.favorite_team,
      columns: VespaClass.values,
      where: '${VespaClass.title} = ?',
      whereArgs: [title],
    );

    if (maps.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  delete(String namateam) async {
    Database db = await instance.database;

    await db.delete(VespaClass.favorite_team,
        where: "${VespaClass.title} = ?", whereArgs: [namateam]);
  }

  // to delete data from database
  deleteTable(String table) async {
    Database db = await instance.database;

    await db.execute("DROP TABLE IF EXSIST $table");
  }
}