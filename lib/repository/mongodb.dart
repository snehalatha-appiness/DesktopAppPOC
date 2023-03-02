import 'dart:developer';

import 'package:demo_poc_app/constants/constants.dart';
import 'package:demo_poc_app/model/usermodel.dart';
import 'package:demo_poc_app/repository/userpreferences.dart';
import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'dart:io' show Platform;

import 'package:shared_preferences/shared_preferences.dart';

class MongoDBConnection {
  late Db db;
  late DbCollection usersCollection;

  late SharedPreferences prefs;
  static dbConnect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    if (kDebugMode) {
      print(status);
    }
    DbCollection collection = db.collection(COLLECTION_NAME);

    print(await collection.find().toList());
  }

  static Future<bool> insertUser(User user) async {
    //collection = db.collection(COLLECTION_NAME);
    Db db = await Db.create(MONGO_URL);
    await db.open();
    DbCollection coll = db.collection(COLLECTION_NAME);

    await coll.insert(user.toMap());

    if (await coll.count != 0) {
      print(await coll.find().toList());
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> checkusername(String username, String password) async {
    Db db = await Db.create(MONGO_URL);
    await db.open();

    DbCollection coll = db.collection(COLLECTION_NAME);
    List<Map<String, dynamic>> users = await coll.find().toList();

    var information = await coll.findOne(where.eq('username', username));
    print('info');
    if (information != null) {
      print(information!['username']);
    }

    await db.close();
    return information != null;
  }

  static Future<bool> updatePassword(
      String username, String fullname, String newpassword) async {
    Db db = await Db.create(MONGO_URL);
    await db.open();

    DbCollection coll = db.collection(COLLECTION_NAME);
    List<Map<String, dynamic>> users = await coll.find().toList();

    var information =
        await coll.findOne({"username": username, "fullname": fullname});
    if (information != null) {
      coll.updateOne(
          where.eq('username', username), modify.set('password', newpassword));
    }

    print('info');
    if (information != null) {
      print(information!['username']);
      print(await coll.find().toList());
    }

    await db.close();
    return information != null;
  }

  static Future<List<String>> getUser(String username, String password) async {
    Db db = await Db.create(MONGO_URL);
    await db.open();

    print('Connected to database');

    DbCollection coll = db.collection(COLLECTION_NAME);
    List<Map<String, dynamic>> users = await coll.find().toList();

    var information = await coll.findOne(where.eq('username', username));
    await db.close();
    List<String> infoList = [];
    User user;
    if (information != null) {
      if (information['password'] == password) {
        infoList = [
          information['username'],
          information['password'],
          information['fullname']
        ];
      }
    }
    print(infoList);
    return infoList;
  }
}
