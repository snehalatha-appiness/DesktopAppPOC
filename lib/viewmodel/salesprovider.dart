/*
 * Filename: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/viewmodel/salesprovider.dart
 * Path: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/viewmodel
 * Created Date: Wednesday, March 1st 2023, 6:31:10 pm
 * Author: Snehalatha
 * 
 * Copyright (c) 2023 Appiness
 */
//SalesProvider updates the sales graph in the dashboard
import 'package:demo_poc_app/model/salesmodel.dart';
import 'package:flutter/material.dart';

class SalesProvider extends ChangeNotifier {
  List<SalesData> salesData = [
    SalesData('2017', 3670028),
    SalesData('2018', 3983507),
    SalesData('2019', 3528040),
    SalesData('2020', 285801),
    SalesData('2021', 3082279),
    SalesData('2022', 3400000)
  ];

  updateData(SalesData data, int index) {
    salesData.removeAt(index);
    salesData.insert(index, data);
    notifyListeners();
  }
}
