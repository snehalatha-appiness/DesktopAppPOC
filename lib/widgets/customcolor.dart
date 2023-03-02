/*
 * Filename: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/widgets/customcolor.dart
 * Path: /Users/appiness1/Documents/Projects/desktopApp/demo_poc/demo_poc_app/lib/widgets
 * Created Date: Thursday, March 2nd 2023, 3:09:57 pm
 * Author: Snehalatha
 * 
 * Copyright (c) 2023 Appiness
 */
//ColumnCustomPainter class used for giving different gradient look for chart
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnCustomPainter extends ColumnSegment {
  @override
  int get currentSegmentIndex => super.currentSegmentIndex!;
  @override
  void onPaint(Canvas canvas) {
    final List<LinearGradient> gradientList = <LinearGradient>[
      const LinearGradient(
          colors: <Color>[Colors.cyan, Colors.greenAccent],
          stops: <double>[0.2, 0.9]),
      const LinearGradient(
          colors: <Color>[Colors.pink, Colors.purpleAccent],
          stops: <double>[0.2, 0.9]),
      const LinearGradient(
          colors: <Color>[Colors.deepPurple, Colors.blue],
          stops: <double>[0.2, 0.9]),
      const LinearGradient(
          colors: <Color>[Colors.deepOrange, Colors.amber],
          stops: <double>[0.2, 0.9]),
      const LinearGradient(
          colors: <Color>[Colors.blue, Colors.cyanAccent],
          stops: <double>[0.2, 0.9]),
      const LinearGradient(
          colors: <Color>[Colors.cyan, Colors.amberAccent],
          stops: <double>[0.2, 0.9]),
    ];

    fillPaint!.shader =
        gradientList[currentSegmentIndex].createShader(segmentRect.outerRect);

    super.onPaint(canvas);
  }
}
