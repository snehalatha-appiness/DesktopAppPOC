//import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
