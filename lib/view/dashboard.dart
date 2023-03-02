/*
 * Filename: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/view/dashboard.dart
 * Path: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/view
 * Created Date: Tuesday, February 28th 2023, 7:01:22 pm
 * Author: Snehalatha
 * 
 * Copyright (c) 2023 Appiness
 */

import 'package:demo_poc_app/constants/themeconstants.dart';
import 'package:demo_poc_app/repository/salesmodel.dart';
import 'package:demo_poc_app/repository/userpreferences.dart';
import 'package:demo_poc_app/viewmodel/registerprovider.dart';
import 'package:demo_poc_app/viewmodel/salesprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Future<String> getUserData() => UserPreferences().getFullname();
    return Consumer<SalesProvider>(
        builder: (BuildContext context, prov, Widget? child) {
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Colors.pinkAccent),
            backgroundColor: Colors.blue.shade500,
            elevation: 0.0,
            title: const Text(
              'Dashboard',
            ),
            centerTitle: false,
            actions: [
              Row(
                children: [
                  FutureBuilder(
                      future: getUserData(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Text('${snapshot.data}');
                        } else {
                          return Text('');
                        }
                      }),
                  IconButton(
                    icon: const Icon(
                      Icons.logout,
                      size: 24,
                    ),
                    tooltip: 'logout',
                    color: Colors.white,
                    onPressed: () {
                      UserPreferences().removeUser();

                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                ],
              ),
            ],
          ),
          body: Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.blue[50],
                    elevation: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.48,
                      height: MediaQuery.of(context).size.height * 0.72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        //color: Colors.white,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Car Sales Report Data'),
                            const SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: prov.salesData.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Container(
                                          color: Colors.white,
                                          margin: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            cursorColor: Colors.grey,
                                            initialValue:
                                                prov.salesData[index].year,
                                            onChanged: ((value) {
                                              prov.salesData[index].year =
                                                  value;
                                              prov.updateData(
                                                  prov.salesData[index], index);
                                              setState(() {});
                                            }),
                                            decoration:
                                                ThemeConstants.setTheme('year'),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.all(8.0),
                                          color: Colors.white,
                                          child: TextFormField(
                                            cursorColor: Colors.grey,
                                            onChanged: ((value) {
                                              prov.salesData[index].sales =
                                                  double.parse(value);
                                              prov.updateData(
                                                  prov.salesData[index], index);
                                              setState(() {});
                                            }),
                                            initialValue: prov
                                                .salesData[index].sales
                                                .toString(),
                                            decoration: const InputDecoration(
                                              labelText: 'sales',

                                              // This is the normal border
                                              border:
                                                  const OutlineInputBorder(),
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                              isCollapsed: true,
                                              fillColor: Colors.white,
                                              contentPadding: EdgeInsets.all(9),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                chart(prov.salesData),
              ],
            ),
          ));
    });
  }

  Widget chart(List<SalesData> data) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.50,
      height: MediaQuery.of(context).size.height * 0.75,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          color: Colors.blue[50],
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Car Sales Report'),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<SalesData, String>>[
                  ColumnSeries<SalesData, String>(
                    gradient: LinearGradient(
                      colors: [
                        HexColor('#428AC9'),
                        HexColor('#E64E90'),
                        HexColor('#EFA63B')
                      ],
                    ),
                    dataSource: data,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    name: '',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    // color: Color.fromRGBO(8, 142, 255, 1),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
