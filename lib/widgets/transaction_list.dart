import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionList extends StatelessWidget{
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override

  Widget build(BuildContext context) {
    return Column(
      // for each transaction via map
      children: userTransactions.map((tx) {
        return Card(
            child: Row(
          // inside this row we have a container and a column
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.purple,
                width: 2,
              )),
              padding: EdgeInsets.all(5),
              width: 100,
              child: Text(
                '£${tx.amount}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
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
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat.yMMMd().format(tx.date),
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                )
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
