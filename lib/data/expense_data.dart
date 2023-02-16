import 'package:expences/data/Hive_Data.dart';
import 'package:expences/datetime/date_time.dart';
import 'package:expences/models/expense_item.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class expenseData extends ChangeNotifier {
  // list of all expenses
  List<expenseItem> overallExpenseList = [];

  // get expense list
  List<expenseItem> getallexpenselist() {
    return overallExpenseList;
  }

  // database
  final db = HiveDataBase();
  void prepareData() {
    if (db.readData().isNotEmpty) {
      overallExpenseList = db.readData();
    }
  }

  // add new expense

  void addNewExpense(expenseItem newExpense) {
    overallExpenseList.add(newExpense);

    notifyListeners();
    db.saveData(overallExpenseList);
  }
  // delete expense

  void deleteExpensive(expenseItem expense) {
    overallExpenseList.remove(expense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  // get wekday

  String getDayname(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Pts';
      case 2:
        return 'Slı';
      case 3:
        return 'Çar';
      case 4:
        return 'Per';
      case 5:
        return 'Cum';
      case 6:
        return 'Cts';
      case 7:
        return 'Pzr';
      default:
        return '';
    }
  }

  // get the date for the start of the week
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    //get todays date
    DateTime today = DateTime.now();

    //go backwards from today to find sunday

    for (int i = 0; i < 7; i++) {
      if (getDayname(today.subtract(Duration(days: i))) == 'Pts') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  Map<String, double> calculateDailyExpensesummary() {
    Map<String, double> dailyExpenseSummary = {};

    for (var expense in overallExpenseList) {
      String date = convertDatetimetoString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}
