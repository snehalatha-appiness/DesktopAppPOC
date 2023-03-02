/*
 * Filename: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/constants/themeconstants.dart
 * Path: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/constants
 * Created Date: Tuesday, February 28th 2023, 4:53:07 pm
 * Author: Snehalatha
 * 
 * Copyright (c) 2023 Appiness
 */

import 'package:flutter/material.dart';

class ThemeConstants {
  static InputDecoration setTheme(String labelText) {
    InputDecoration inputDecoration = InputDecoration(
        labelText: labelText,

        // This is the normal border
        border: const OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
        isCollapsed: true,
        contentPadding: EdgeInsets.all(9),
        // This is the error border
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.5)));
    return inputDecoration;
  }
}
