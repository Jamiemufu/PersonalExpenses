import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final userTitle = titleController.text;
    final userAmount = double.parse(amountController.text);

    if (userTitle.isEmpty || userAmount <= 0) {
      return;
    }

    widget.addNewTransaction(userTitle, userAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 25, 15, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              child: TextField(
                // specifify controller to save input data
                controller: titleController,
                onSubmitted: (val) => submitData(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Title',
                  contentPadding: EdgeInsets.all(0),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: TextField(
                // specifify controller to save input data
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitData(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),

                decoration: InputDecoration(
                    labelText: 'Amount',
                    prefixText: "£",
                    contentPadding: EdgeInsets.all(0),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: RaisedButton(
                elevation: 10,
                onPressed: submitData,
                color: Colors.purple,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
