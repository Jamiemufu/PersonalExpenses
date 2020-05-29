import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addNewTransaction);

  void submitData() {
    final userTitle = titleController.text;
    final userAmount = double.parse(amountController.text);

    if(userTitle.isEmpty || userAmount <= 0) {
      return;
    }

    addNewTransaction(userTitle, userAmount);
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
                keyboardType: TextInputType.numberWithOptions(decimal:true),
                onSubmitted: (_) => submitData(),
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
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
