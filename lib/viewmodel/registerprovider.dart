import 'package:demo_poc_app/model/usermodel.dart';
import 'package:demo_poc_app/repository/mongodb.dart';
import 'package:demo_poc_app/repository/userpreferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterProvider extends ChangeNotifier {
  String? usname;
  String? fname;
  String? password;
  late bool loginstate = false;
  late SharedPreferences prefs;
  Future<bool> insertUser(String name, String username, String password,
      BuildContext context) async {
    bool val = false;
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

  Future<bool> login(
      String username, String password, BuildContext context) async {
    var snackBar = const SnackBar(content: Text('Please wait..'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    List<String> user = await MongoDBConnection.getUser(username, password);
    if (user.isNotEmpty) {
      usname = username;
      loginstate = true;
    }
    return user.isNotEmpty;
  }

  Future<bool> updatePassword(String username, String fullname,
      String newpassword, BuildContext context) async {
    var snackBar = const SnackBar(content: Text('Please wait..'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    bool val =
        await MongoDBConnection.updatePassword(username, fullname, newpassword);

    return val;
  }
}
