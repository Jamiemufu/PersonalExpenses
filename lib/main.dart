import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        backgroundColor: Colors.purple,
        title: Text('Personal Expenses'),
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
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  // inside this row we have a container and a column
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2,)),
                      padding: EdgeInsets.all(5),
                      width: 100,
                      child: Text(
                        '£${tx.amount}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                         DateFormat.yMMMd().format(tx.date),
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                )
              );
            }).toList(),
          )
        ]
      )
    );
  }
}
