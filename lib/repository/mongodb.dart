import 'dart:developer';

import 'package:demo_poc_app/constants/constants.dart';
import 'package:demo_poc_app/model/usermodel.dart';
import 'package:demo_poc_app/repository/userpreferences.dart';
import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'dart:io' show Platform;

String host = Platform.environment['MONGO_DART_DRIVER_HOST'] ?? '127.0.0.1';
String port = Platform.environment['MONGO_DART_DRIVER_PORT'] ?? '27017';

class MongoDBConnection {
  static var collection;
  static dbConnect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    await db.drop();
    inspect(db);
    var status = db.serverStatus();
    if (kDebugMode) {
      print(status);
    }
    DbCollection collection = db.collection(COLLECTION_NAME);

    // await collection.insertAll([user.toMap()]);

    print(await collection.find().toList());
  }

  static Future<bool> insertUser(User user) async {
    //collection = db.collection(COLLECTION_NAME);
    Db db = await Db.create(MONGO_URL);
    await db.open();
    DbCollection coll = db.collection(COLLECTION_NAME);
    await coll.insert(user.toMap());
    UserPreferences().saveUser(user);
    if (await coll.count != 0) {
      print(await coll.find().toList());
      return true;
    } else {
      return false;
    }
  }

  static Future<List<String>> getUser(String username, String password) async {
    Db db = await Db.create(MONGO_URL);
    await db.open();

    print('Connected to database');

    DbCollection coll = db.collection(COLLECTION_NAME);
    var information = await coll.findOne(where.eq('username', username));
    await db.close();
    List<String> infoList = [
      information!['username'],
      information!['password']
    ];
    return infoList;
  }
}
