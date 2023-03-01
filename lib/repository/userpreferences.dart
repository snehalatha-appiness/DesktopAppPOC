import 'package:demo_poc_app/model/usermodel.dart';
import 'package:mongo_dart/mongo_dart.dart';
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
}
