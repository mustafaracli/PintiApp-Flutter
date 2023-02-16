import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getbottomTiles(double value, TitleMeta meta) {
  const Style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  Widget text;

  switch (value.toInt()) {
    case 0:
      text = const Text('P', style: Style);
      break;

    case 1:
      text = const Text('S', style: Style);
      break;

    case 2:
      text = const Text('Ç', style: Style);
      break;

    case 3:
      text = const Text('P', style: Style);
      break;

    case 4:
      text = const Text('C', style: Style);
      break;

    case 5:
      text = const Text('C', style: Style);
      break;

    case 6:
      text = const Text('P', style: Style);
      break;
    default:
      text = const Text('', style: Style);
      break;
  }

  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
