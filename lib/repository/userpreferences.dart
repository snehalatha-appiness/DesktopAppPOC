/*
 * Filename: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/repository/userpreferences.dart
 * Path: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/repository
 * Created Date: Wednesday, March 1st 2023, 8:03:45 am
 * Author: Snehalatha
 * 
 * Copyright (c) 2023 Appiness
 */
//Shared preferences file for storing user data locally

import 'package:demo_poc_app/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // prefs.setString("userId", user.id.toString());
    prefs.setString("fullname", user.fullname);
    prefs.setString("username", user.username);
    prefs.setString("password", user.password);

    return true;
  }

  Future<String> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //String? userId = prefs.getString("userId");
    String? fullname = prefs.getString("fullname");
    String? username = prefs.getString("username");
    String? password = prefs.getString("password");

    return username!;
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // prefs.remove("userId");
    prefs.remove("fullname");
    prefs.remove("username");
    prefs.remove("password");
  }

  Future<String> getUsername(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("username");
    return token!;
  }

  Future<String> getFullname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("fullname");
    return token!;
  }
}
