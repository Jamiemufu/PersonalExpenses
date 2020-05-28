import 'package:flutter/material.dart';

import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
        id: 't1',
        title: 'Monitor',
        amount: 142.99,
        date: DateTime.now()
    ),
    Transaction(
        id: 't2',
        title: 'Monitor Stand',
        amount:62.49,
        date: DateTime.now()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        // column contains children widgets
        body: Column(
            // column and rows are like flexbex - main axis and crossaxis
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              Card(
                color: Colors.red,
                child: Text("List of TX"),
              ),
            ]));
  }
}
