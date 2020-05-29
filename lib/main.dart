import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // use flutter controllers to store userinput
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'Monitor', amount: 142.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Monitor Stand', amount: 62.49, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Speakers', amount: 39.99, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'Gaming Mouse', amount: 89.99, date: DateTime.now()),
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _removeTransaction(String toRemove) {
    setState(() {
      _userTransactions.removeWhere((item) => item.id == toRemove);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
        backgroundColor: Colors.purple,
        title: Text('Personal Expenses'),
      ),
      // column contains children widgets
      body: SingleChildScrollView(
        child: Column(
            // column and rows are like flexbex - main axis and crossaxis
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // you can wrap widgets in a parent such as container
              // you can use this to set certain properties on that specific widget
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text("CHART!"),
                  elevation: 5,
                ),
              ),
              TransactionList(_userTransactions, _removeTransaction),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
