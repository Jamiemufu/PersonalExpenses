import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              child: TextField(
                // specifify controller to save input data
                controller: titleController,
                style: TextStyle(color: Colors.black, fontSize: 14),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Title',
                  contentPadding: EdgeInsets.all(0),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.purple,
                  )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                    color: Colors.purple,
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
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    labelText: 'Amount',
                    prefixText: "£",
                    contentPadding: EdgeInsets.all(0),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    labelStyle: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                addNewTransaction(titleController.text, double.parse(amountController.text));
                // hide keyboard afger pressing button
                FocusScope.of(context).unfocus();
              },
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
