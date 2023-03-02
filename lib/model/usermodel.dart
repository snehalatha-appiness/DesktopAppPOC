/*
 * Filename: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/model/usermodel.dart
 * Path: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/model
 * Created Date: Tuesday, February 28th 2023, 3:40:52 pm
 * Author: Snehalatha
 * 
 * Copyright (c) 2023 Appiness
 */
//Defines user model with user properties

import 'package:mongo_dart/mongo_dart.dart';

class User {
  final ObjectId? id;
  final String fullname;
  final String username;
  final String password;

  const User(
      {this.id,
      required this.fullname,
      required this.username,
      required this.password});
  Map<String, dynamic> toMap() => {
        "fullname": fullname,
        "username": username,
        "password": password,
      };
}
