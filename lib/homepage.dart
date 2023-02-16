import 'package:expences/components/expenseSummary.dart';
import 'package:expences/components/expenseTile.dart';
import 'package:expences/data/expense_data.dart';
import 'package:expences/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepagestate();
}

class _homepagestate extends State<homepage> {
  // text controll
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();
  final newExpenseKrsController = TextEditingController();
  // add new

  @override
  void initState() {
    super.initState();

    Provider.of<expenseData>(context, listen: false).prepareData();
  }

  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'Harcama Ekle',
          textAlign: TextAlign.center,
        ),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            controller: newExpenseNameController,
            decoration: InputDecoration(
              hintText: "Harcama Adı",
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: newExpenseAmountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Tutar(₺)",
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: newExpenseKrsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Tutar(Krş)",
                  ),
                ),
              ),
            ],
          )
        ]),
        actions: [
          MaterialButton(
            onPressed: save,
            child: Text(
              'Kaydet',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          MaterialButton(
            onPressed: cancel,
            child: Text(
              'Vazgeç',
              style: TextStyle(fontWeight: FontWeight.w100),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  //delete expense

  void deleteExpense(expenseItem expense) {
    Provider.of<expenseData>(context, listen: false).deleteExpensive(expense);
  }

  void save() {
    if (newExpenseNameController.text.isNotEmpty &&
        newExpenseAmountController.text.isNotEmpty) {
      String amount =
          '${newExpenseAmountController.text}.${newExpenseKrsController.text}';
      expenseItem newExpense = expenseItem(
          name: newExpenseNameController.text,
          amount: amount,
          dateTime: DateTime.now());

      Provider.of<expenseData>(context, listen: false)
          .addNewExpense(newExpense);
    }

    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
    newExpenseKrsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<expenseData>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amberAccent[400],
            automaticallyImplyLeading: false,
            toolbarHeight: 20,
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amberAccent[400],
            onPressed: addNewExpense,
            child: const Icon(Icons.addchart),
          ),
          body: ListView(
            children: [
              expenseSummary(startOfWeek: value.startOfWeekDate()),
              const SizedBox(height: 20),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.getallexpenselist().length,
                  itemBuilder: (context, index) => expenseTile(
                        name: value.getallexpenselist()[index].name,
                        amount: value.getallexpenselist()[index].amount,
                        dateTime: value.getallexpenselist()[index].dateTime,
                        deleteTapped: (p0) =>
                            deleteExpense(value.getallexpenselist()[index]),
                      )),
            ],
          )),
    );
  }
}
