import 'package:flutter/foundation.dart';

class TextFieldValidator extends ChangeNotifier {
  String? validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validateOtp(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{4,4}$)';
    RegExp regExp = RegExp(patttern);
    String otp = '0000';
    if (value.isEmpty) {
      return 'Please enter Otp';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid Otp';
    } else if (value != otp) {
      return 'Please enter valid Otp';
    }
    return null;
  }

  String? validateFname(String value) {
    if (value.isEmpty || value.length < 3) {
      return 'Please enter fullname';
    }
    return null;
  }

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

  String? validateConfirmPassword(String value, String newpassword) {
    if (value.isEmpty) {
      return 'Please enter password';
    } else if (value != newpassword) {
      return 'Password does not match';
    }
    return null;
  }

  String? validateUsername(String value) {
    if (value.isEmpty) {
      return 'Please enter username';
    } else if (value.length <= 6) {
      return 'Please enter valid username';
    }
    return null;
  }

  bool validatePasswordExp(String value) {
    String pattern = r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
