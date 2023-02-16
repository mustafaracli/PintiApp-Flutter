import 'package:expences/bar/bar.dart';

class barData {
  final double ptsAmount;
  final double salAmount;
  final double carAmount;
  final double perAmount;
  final double cumAmount;
  final double ctsAmount;
  final double pzrAmount;

  barData({
    required this.ptsAmount,
    required this.salAmount,
    required this.carAmount,
    required this.perAmount,
    required this.cumAmount,
    required this.ctsAmount,
    required this.pzrAmount,
  });

  List<bar> bardata = [];

  void barDayData() {
    bardata = [
      bar(x: 0, y: ptsAmount),
      bar(x: 1, y: salAmount),
      bar(x: 2, y: carAmount),
      bar(x: 3, y: perAmount),
      bar(x: 4, y: cumAmount),
      bar(x: 5, y: ctsAmount),
      bar(x: 6, y: pzrAmount),
    ];
  }
}
