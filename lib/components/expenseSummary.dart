import 'package:expences/bar/barGraph.dart';
import 'package:expences/data/expense_data.dart';
import 'package:expences/datetime/date_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class expenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const expenseSummary({super.key, required this.startOfWeek});

  double calculateMax(
    expenseData value,
    String pazartesi,
    String sali,
    String carsamba,
    String persembe,
    String cuma,
    String cumartesi,
    String pazar,
  ) {
    double? max = 100;

    List<double> values = [
      value.calculateDailyExpensesummary()[pazartesi] ?? 0,
      value.calculateDailyExpensesummary()[sali] ?? 0,
      value.calculateDailyExpensesummary()[carsamba] ?? 0,
      value.calculateDailyExpensesummary()[persembe] ?? 0,
      value.calculateDailyExpensesummary()[cuma] ?? 0,
      value.calculateDailyExpensesummary()[cumartesi] ?? 0,
      value.calculateDailyExpensesummary()[pazar] ?? 0,
    ];
    values.sort();

    max = values.last * 1.1;

    return max == 0 ? 10 : max;
  }

  String calculateWeekTotal(
    expenseData value,
    String pazartesi,
    String sali,
    String carsamba,
    String persembe,
    String cuma,
    String cumartesi,
    String pazar,
  ) {
    List<double> values = [
      value.calculateDailyExpensesummary()[pazartesi] ?? 0,
      value.calculateDailyExpensesummary()[sali] ?? 0,
      value.calculateDailyExpensesummary()[carsamba] ?? 0,
      value.calculateDailyExpensesummary()[persembe] ?? 0,
      value.calculateDailyExpensesummary()[cuma] ?? 0,
      value.calculateDailyExpensesummary()[cumartesi] ?? 0,
      value.calculateDailyExpensesummary()[pazar] ?? 0,
    ];
    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    String pazartesi =
        convertDatetimetoString(startOfWeek.add(const Duration(days: 0)));
    String sali =
        convertDatetimetoString(startOfWeek.add(const Duration(days: 1)));
    String carsamba =
        convertDatetimetoString(startOfWeek.add(const Duration(days: 2)));
    String persembe =
        convertDatetimetoString(startOfWeek.add(const Duration(days: 3)));
    String cuma =
        convertDatetimetoString(startOfWeek.add(const Duration(days: 4)));
    String cumartesi =
        convertDatetimetoString(startOfWeek.add(const Duration(days: 5)));
    String pazar =
        convertDatetimetoString(startOfWeek.add(const Duration(days: 6)));

    return Consumer<expenseData>(
        builder: (context, value, child) => Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      calculateWeekTotal(value, pazartesi, sali, carsamba,
                              persembe, cuma, cumartesi, pazar) +
                          ' ₺',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          backgroundColor: Color.fromARGB(255, 235, 235, 235),
                          fontFamily: "Roboto"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: barGraph(
                    maxY: calculateMax(value, pazartesi, sali, carsamba,
                        persembe, cuma, cumartesi, pazar),
                    ptsAmount:
                        value.calculateDailyExpensesummary()[pazartesi] ?? 0,
                    salAmount: value.calculateDailyExpensesummary()[sali] ?? 0,
                    carAmount:
                        value.calculateDailyExpensesummary()[carsamba] ?? 0,
                    perAmount:
                        value.calculateDailyExpensesummary()[persembe] ?? 0,
                    cumAmount: value.calculateDailyExpensesummary()[cuma] ?? 0,
                    ctsAmount:
                        value.calculateDailyExpensesummary()[cumartesi] ?? 0,
                    pzrAmount: value.calculateDailyExpensesummary()[pazar] ?? 0,
                  ),
                ),
              ],
            ));
  }
}
