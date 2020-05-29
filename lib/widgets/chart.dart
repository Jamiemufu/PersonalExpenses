import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  // I still dont really get getters
  // sets a new list map of string and object
  List<Map<String, Object>> get groupedTransactionValues {
    // generate 7 list items with an index
    return List.generate(7, (index) {
      // calulate weekday for 7 days
      // build in DateTime subtract with Duration of 7 days
      final weekday = DateTime.now().subtract(Duration(days: index));
      
      var totalSum = 0.0;

      // foreach recentTransaction passed check it matches current day
      // if it does add
      for(var i=0; i < recentTransactions.length; i++) {
        if(recentTransactions[i].date.day == weekday.day &&
          recentTransactions[i].date.month == weekday.month &&
          recentTransactions[i].date.year == weekday.year) {
            totalSum += recentTransactions[i].amount;
          }
      }

      print(DateFormat.E().format(weekday));
      print(totalSum);

      // return calculated days and amounts
      return {'Day': DateFormat.E().format(weekday), 'amount': totalSum};
    });
  }

  @override

  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          
        ],
      ),
    );
  }
}