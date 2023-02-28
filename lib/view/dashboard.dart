import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'Welcome onboard!',
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
