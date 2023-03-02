/*
 * Filename: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/viewmodel/textfieldvalidators.dart
 * Path: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/viewmodel
 * Created Date: Tuesday, February 28th 2023, 3:11:12 pm
 * Author: Snehalatha
 * 
 * Copyright (c) 2023 Appiness
 */
//TextValidations consist of all the validations used for the fields

import 'package:flutter/foundation.dart';

class TextFieldValidator extends ChangeNotifier {
  //validation for full name
  String? validateFname(String value) {
    if (value.isEmpty || value.length < 3) {
      return 'Please enter full name';
    }
    return null;
  }

  //validation for password
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter password';
    } else if (value.length <= 6) {
      return 'Please enter valid password';
    } else {
      if (validatePasswordExp(value)) {
        return null;
      } else {
        return 'Please enter valid password';
      }
    }
  }

  //validation for confirm password
  String? validateConfirmPassword(String value, String newpassword) {
    if (value.isEmpty) {
      return 'Please enter password';
    } else if (value != newpassword) {
      return 'Password does not match';
    }
    return null;
  }

//validation for username
  String? validateUsername(String value) {
    if (value.isEmpty) {
      return 'Please enter username';
    } else if (value.length <= 6) {
      return 'Please enter valid username';
    }
    return null;
  }

//regualar expression pattern matching for  password
  bool validatePasswordExp(String value) {
    String pattern = r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
