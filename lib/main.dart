import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

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

class MyHomePage extends StatelessWidget {
  // use flutter controllers to store userinput
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                UserTransactions(),
              ]),
        ));
  }
}
