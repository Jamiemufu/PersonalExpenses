import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function removeTransaction;

  TransactionList(this.userTransactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (context, index) {
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
                  '£${userTransactions[index].amount.toStringAsFixed(2)}',
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
                  Container(
                    width: 225,
                    child: Text(
                      userTransactions[index].title,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 225,
                    child: Text(
                      DateFormat.yMMMd().format(userTransactions[index].date),
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                    child: IconButton(
                        onPressed: () {
                          removeTransaction(userTransactions[index].id);
                        },
                        icon: Icon(
                      Icons.delete,
                      color: Colors.black,
                    )),
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(right: 10)),
              )
            ],
          ));
        },
        itemCount: userTransactions.length,
      ),
        // for each transaction via map
    );
  }
}
