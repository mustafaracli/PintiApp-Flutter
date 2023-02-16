import 'package:expences/bar/barData.dart';
import 'package:expences/widgets/getbottomWidgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class barGraph extends StatelessWidget {
  final double? maxY;
  final double ptsAmount;
  final double salAmount;
  final double carAmount;
  final double perAmount;
  final double cumAmount;
  final double ctsAmount;
  final double pzrAmount;

  const barGraph(
      {super.key,
      required this.maxY,
      required this.ptsAmount,
      required this.salAmount,
      required this.carAmount,
      required this.perAmount,
      required this.cumAmount,
      required this.ctsAmount,
      required this.pzrAmount});

  @override
  Widget build(BuildContext context) {
    barData mebardata = barData(
      ptsAmount: ptsAmount,
      salAmount: salAmount,
      carAmount: carAmount,
      perAmount: perAmount,
      cumAmount: cumAmount,
      ctsAmount: ctsAmount,
      pzrAmount: pzrAmount,
    );

    mebardata.barDayData();

    return BarChart(BarChartData(
      maxY: maxY,
      minY: 0,
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: getbottomTiles,
        )),
      ),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      barGroups: mebardata.bardata
          .map((data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                    toY: data.y,
                    color: Colors.amberAccent[400],
                    width: 20,
                    borderRadius: BorderRadius.circular(5),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: maxY,
                      color: Color.fromARGB(255, 122, 122, 122),
                    ))
              ]))
          .toList(),
    ));
  }
}
