import 'dart:developer';

import 'package:demo_poc_app/constants.dart';
import 'package:demo_poc_app/model/usermodel.dart';
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
    User user = User(fullname: 'Sneha', username: 'sne', password: 'pass');
    await collection.insertAll([user.toMap()]);

    print(await collection.find().toList());
  }

  static Future<bool> insertUser(User user) async {
    //collection = db.collection(COLLECTION_NAME);

    await collection.insertAll([user.toMap()]);
    if (await collection.count != 0) {
      print(await collection.find().toList());
      return true;
    } else {
      return false;
    }
  }
}
