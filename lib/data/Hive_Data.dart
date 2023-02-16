import 'package:hive/hive.dart';
import 'package:expences/models/expense_item.dart';

class HiveDataBase {
  final _mybox = Hive.box("expense_database2");

  void saveData(List<expenseItem> allExpense) {
    List<List<dynamic>> allExpensesFormatted = [];
    for (var expense in allExpense) {
      List<dynamic> expenceformatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpensesFormatted.add(expenceformatted);
    }

    _mybox.put("all_expences", allExpensesFormatted);
  }

  List<expenseItem> readData() {
    List savedExpences = _mybox.get("all_expences") ?? [];
    List<expenseItem> allExpences = [];

    for (int i = 0; i < savedExpences.length; i++) {
      String name = savedExpences[i][0];
      String amount = savedExpences[i][1];
      DateTime dateTime = savedExpences[i][2];

      expenseItem expense = expenseItem(
        name: name,
        amount: amount,
        dateTime: dateTime,
      );

      allExpences.add(expense);
    }
    return allExpences;
  }
}
