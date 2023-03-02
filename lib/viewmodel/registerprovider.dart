/*
 * Filename: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/viewmodel/registerprovider.dart
 * Path: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/viewmodel
 * Created Date: Tuesday, February 28th 2023, 3:12:06 pm
 * Author: Snehalatha
 * 
 * Copyright (c) 2023 Appiness
 */
//RegisterProvider manages th state of the overall login/register process

import 'package:demo_poc_app/model/usermodel.dart';
import 'package:demo_poc_app/repository/mongodb.dart';
import 'package:demo_poc_app/repository/userpreferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterProvider extends ChangeNotifier {
  String? usname;
  String? fname;
  String? password;
  late bool loginstate = false, loading = false;
  late SharedPreferences prefs;

  //Insert user in db
  Future<bool> insertUser(String name, String username, String password,
      BuildContext context) async {
    bool val = false;
    loading = true;
    var snackBar = const SnackBar(content: Text('Please wait..'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    await MongoDBConnection.checkusername(username, password)
        .then((value) async {
      if (value) {
      } else {
        User user =
            User(fullname: name, username: username, password: password);
        val = await MongoDBConnection.insertUser(user).then(
          (value) => UserPreferences().saveUser(user),
        );
      }
    });
    return val;
  }

// login
  Future<bool> login(
      String username, String password, BuildContext context) async {
    loading = true;
    var snackBar = const SnackBar(content: Text('Please wait..'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    List<String> user = await MongoDBConnection.getUser(username, password);
    if (user.isNotEmpty) {
      usname = username;
      loginstate = true;
      User users =
          User(fullname: user[2], username: user[0], password: user[1]);
      UserPreferences().saveUser(users);
    }
    return user.isNotEmpty;
  }

//update password for the user
  Future<bool> updatePassword(String username, String fullname,
      String newpassword, BuildContext context) async {
    loading = true;
    var snackBar = const SnackBar(content: Text('Please wait..'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    bool val =
        await MongoDBConnection.updatePassword(username, fullname, newpassword);

    return val;
  }
}
