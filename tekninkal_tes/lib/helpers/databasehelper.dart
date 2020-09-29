import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:convert';

import 'package:tekninkal_tes/models/profile.dart';

class DatabaseHelper{

  final String tableProfiles = 'profile';
  final String columnid = 'id';
  final String columnName = 'name';
  final String columnEmail = 'email';
  final String columnidodoo = 'odooid';
  final String columnphone = 'phone';

  static final _databaseName = 'bubunmobile.db';
  static final _databaseversion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    print('database : $_database');
    // final PermissionHandler _permissionHandler = PermissionHandler();
    if (_database != null) return _database;
      // var result = await _permissionHandler.requestPermissions([PermissionGroup.accessMediaLocation]);
      // if(result[PermissionGroup.accessMediaLocation] == PermissionStatus.granted){
      _database = await _initDatabase();
      return _database;
  }
      // return _database;

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    print(path);
    return await openDatabase(path,
    version: _databaseversion,
    onCreate: _onCreate);
  }
    Future _onCreate(Database db,int version) async {
      await db.execute('''
      Create table $tableProfiles (
        $columnid INTEGER PRIMAY KEY, 
        $columnName TEXT NOT NULL,
        $columnEmail TEXT NOT NULL,
        $columnidodoo INTEGER,
        $columnphone TEXT NOT NULL) ''');
    }

    Future<int>  Insert(Profile profile) async {
      Database db = await database;
      db.execute('''Delete from $tableProfiles ''');
      int id = await db.insert(tableProfiles, profile.toMap());
      var result = await db.rawQuery('select * from profile');
      // var exists = result.isNotEmpty;
      print(json.encode(result));
      return id;
    }

    Future<int>  Delete() async {
      Database db = await database;
      db.execute('''Delete from $tableProfiles ''');
      
      return 1;
    }


    Future<Profile> queryProfile(int id) async {
      Database db = await database;
      // var result = await db.rawQuery('select * from profile where _id = $id');
      var result = await db.rawQuery('select * from profile');
      // List<Map> maps = await db.query(tableProfiles,
      // columns: [columnid,columnName,columnEmail,columnidodoo,columnphone],
      // where: '$columnid = ?',
      // whereArgs: [id]);
      // var recs = result.length;

      print('query $id and $result');
      if(result.length > 0){
        return Profile.fromMap(result.first);
      }
      return null;
    }

    Future<Profile> queryProfilebyphone(String user) async {
      Database db = await database;
      List<Map> maps = await db.query(tableProfiles,
      columns: [columnid,columnName,columnEmail,columnidodoo,columnphone],
      where: '$columnphone = ?',
      whereArgs: [user]);

      if(maps.length > 0){
        return Profile.fromMap(maps.first);
      }
      return null;
    }

    Future<Profile> queryProfilebyemail(String user) async {
      Database db = await database;
      List<Map> maps = await db.query(tableProfiles,
      columns: [columnid,columnName,columnEmail,columnidodoo,columnphone],
      where: '$columnEmail = ?',
      whereArgs: [user]);

      if(maps.length > 0){
        return Profile.fromMap(maps.first);
      }
      return null;
    }


}