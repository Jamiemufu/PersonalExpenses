import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() {
  // force portrait mode
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
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

  bool _showChart = false;

  // getter used to calculate transactions in past 7 days
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: chosenDate,
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
    /**
     * Widgets & Vars
     */

    final mediaQuery = MediaQuery.of(context);
    final isLandscape =
        mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
      title: Text('Personal Expenses'),
    );

    final txListWidget = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.8,
        child: TransactionList(_userTransactions, _removeTransaction));

    /**
     * Scaffold
     */
    return Scaffold(
      appBar: appBar,
      // column contains children widgets
      body: SingleChildScrollView(
        child: Column(
            // column and rows are like flexbex - main axis and crossaxis
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Show Chart"),
                    Switch(
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      },
                    ),
                  ],
                ),
              // you can wrap widgets in a parent such as container
              // you can use this to set certain properties on that specific widget

              if (!isLandscape)
                Container(
                    height: (mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.3,
                    child: Chart(_recentTransactions)),

              if (!isLandscape)
                txListWidget,

              if (isLandscape)
                _showChart
                    ? Container(
                        height: (mediaQuery.size.height -
                                appBar.preferredSize.height -
                                mediaQuery.padding.top) *
                            0.8,
                        child: Chart(_recentTransactions))
                    : txListWidget
            ]),
      ),
    );
  }
}
