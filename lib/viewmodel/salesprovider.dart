import 'package:demo_poc_app/repository/salesmodel.dart';
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
