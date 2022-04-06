// ignore_for_file: unused_import

import 'package:projectadvance/model/konsumen.dart';
import 'package:projectadvance/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';

class Service {
  static Future<void> createTables(Database database) async {
    await database.execute("""
      CREATE TABLE users(
        userid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        username TEXT NOT NULL,
        password TEXT NOT NULL,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        createdBy INTEGER NOT NULL
      );
     
      """);
    await database.execute("""
     CREATE TABLE konsumen(
        konsumenid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nama TEXT NOT NULL,
        nohp TEXT NOT NULL,
        merk TEXT NOT NULL,
        model TEXT NOT NULL,
        tglLhir TEXT NOT NULL,
        ktploc TEXT NOT NULL,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        createdby INTEGER NOT NULL,
        FOREIGN KEY(createdBy) REFERENCES user(userid)
      );
     
      """);
  }

  static Future<Database> openDb() async {
    return openDatabase(
      "projectadvance.db",
      version: 2,
      onCreate: (Database db, int version) async {
        await createTables(db);
      },
    );
  }

  static Future<int> createUsers(String username, String password) async {
    final db = await openDb();
    final user = User(
      username: username,
      password: password,
      createdBy: "ADMIN",
    );
    final id = await db.insert("users", user.toMap());
    return id;
  }

  static Future<int> createItems(String name, String nohp, String merk,
      String mode, String ktploc, String tgllahir) async {
    final db = await openDb();
    // final data =
    final konsumen = Konsumen(
      nama: name,
      nohp: nohp,
      merk: merk,
      model: mode,
      tglLhir: tgllahir,
      ktploc: ktploc,
      createdby: 1,
    );
    // var req = await db.execute("""
    //  CREATE TABLE konsumen(
    //     konsumenid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    //     nama TEXT NOT NULL,
    //     nohp TEXT NOT NULL,
    //     merk TEXT NOT NULL,
    //     model TEXT NOT NULL,
    //     tglLhir TEXT NOT NULL,
    //     ktploc TEXT NOT NULL,
    //     createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    //     createdby INTEGER NOT NULL,
    //     FOREIGN KEY(createdBy) REFERENCES user(userid)
    //   );

    //   """);
    final id = await db.insert("konsumen", konsumen.toMap());
    return id;
  }

  static Future<List<Konsumen>> getItems() async {
    final db = await openDb();
    List result = await db.query("konsumen", orderBy: "konsumenid");

    return result.map((e) => Konsumen.fromMap(e)).toList();
  }

  static Future<List<UserRetrieve>> getUser() async {
    final db = await openDb();

    List result = await db.query("users", orderBy: "userid");

    return result.map((e) => UserRetrieve.fromMap(e)).toList();
  }

  static Future<bool> login(String username, String password) async {
    final db = await openDb();
    final result = await db.query("users",
        where: 'username = ?', whereArgs: [username], limit: 1);
    if (result[0]["password"] == password) {
      return true;
    }
    return false;
  }
}
