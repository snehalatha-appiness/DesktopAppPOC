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
    if (value.isEmpty || value.length <= 3) {
      return 'Please enter full name';
    }
    return null;
  }

  String? validateUsername(String value) {
    if (value.isEmpty || value.length <= 6) {
      return 'Please enter username';
    }
    return null;
  }

  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter email';
    } else if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else {
      return null;
    }
  }
}
