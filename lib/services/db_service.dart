import 'package:encrypt/encrypt.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/user_model.dart';

class DBService{
  static final DBService instance = DBService._init();

  static Database? _database;

  var key = Key.fromBase64('eNCrypTkEyINFRANM+EGQw==');
  var iv = IV.fromBase64('eNcRYPTIvdOaMiVbviaWHA==');

  DBService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb('infra_database.db');
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    userName TEXT NOT NULL,
    name TEXT NOT NULL,
    password TEXT NOT NULL,
    address TEXT NOT NULL
    )
    ''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

  Future<UserModel> createUser(UserModel userModel) async {

    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(userModel.password, iv: iv);
    userModel = userModel.copy(password: encrypted.base64);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print("decrypted : $decrypted");
    print("encr : ${encrypted.base64}");

    final db = await instance.database;

    final id = await db.insert('users', userModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return userModel.copy(id: id);
  }

  Future<UserModel> readUser(int id) async {
    final db = await instance.database;

    final maps = await db.query('users',
        columns: ['userName', 'name', 'password'],
        where: '_id = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<UserModel> loginUser(String userName, String password) async {

    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(password, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print("decrypted : $decrypted");
    print("encr : ${encrypted.base64}");


    final db = await instance.database;

    final maps = await db.query('users',
        columns: ['_id', 'userName', 'name', 'password'],
        where: 'userName = ? AND password = ?',
        whereArgs: [userName, encrypted.base64]);

    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps.first);
    } else {
      throw 'User not found';
    }
  }

  Future<List<UserModel>> readAllUser() async {
    final db = await instance.database;

    final result = await db.query('users', orderBy: 'name ASC');

    return result.map((json) => UserModel.fromJson(json)).toList();
  }

  Future<int> updateUser(UserModel userModel) async {
    final db = await instance.database;

    return db.update('users', userModel.toMap(),
        where: '_id = ?', whereArgs: [userModel.id]);
  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;

    return db.delete('users', where: '_id = ?', whereArgs: [id]);
  }
}