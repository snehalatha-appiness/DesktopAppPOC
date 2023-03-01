import 'package:demo_poc_app/constants/themeconstants.dart';
import 'package:demo_poc_app/repository/salesmodel.dart';
import 'package:demo_poc_app/repository/userpreferences.dart';
import 'package:demo_poc_app/viewmodel/registerprovider.dart';
import 'package:demo_poc_app/viewmodel/salesprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  /*
  2015	3,117,550	6.36
2016	3,345,460	7.31
2017	3,670,028	9.70
2018	3,983,507	8.54
2019	3,528,040	-11.43
2020	2,858,011	-18.99

  */

  List<TextEditingController> _yearcontrollers = [];
  @override
  Widget build(BuildContext context) {
    RegisterProvider provider = context.read<RegisterProvider>();
    return Consumer<SalesProvider>(
        builder: (BuildContext context, prov, Widget? child) {
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.pinkAccent),
            backgroundColor: Colors.pinkAccent,
            elevation: 0.0,
            title: Text(
              'Dashboard',
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout_outlined),
                tooltip: 'logout',
                onPressed: () {
                  UserPreferences().removeUser();

                  Navigator.pushReplacementNamed(context, '/home');
                },
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
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
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
                                                ThemeConstants.setTheme('Year'),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
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
                                            decoration: ThemeConstants.setTheme(
                                                'sales'),
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
                // Chart title
                title: ChartTitle(text: 'Car Sales Report'),
                // Enable legend
                legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<SalesData, String>>[
                  ColumnSeries<SalesData, String>(
                      dataSource: data,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      name: '',
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
          ),
        ),
      ),
    );
  }
}
