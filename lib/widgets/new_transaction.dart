import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    final userTitle = titleController.text;
    final userAmount = double.parse(amountController.text);

    if (userTitle.isEmpty || userAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addNewTransaction(userTitle, userAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 25, right: 10),
              child: IconButton(
                  icon: Icon(Icons.close,
                      size: 40, color: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15, 25, 15, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SafeArea(
                      child: Container(
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
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Container(
                        margin: EdgeInsets.only(top: 15),
                        child: TextField(
                          // specifify controller to save input data
                          controller: amountController,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
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
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                              labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SafeArea(
                      bottom: false,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              _selectedDate == null
                                  ? "No date chosen"
                                  : 'Chosen date: ${DateFormat.yMd().format(_selectedDate)}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          RaisedButton(
                              elevation: 10,
                              onPressed: _presentDatePicker,
                              color: Colors.purple,
                              child: Container(
                                alignment: Alignment.center,
                                width: 105,
                                child: Text(
                                  "Choose date",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                              
                        ],
                      ),
                    ),
                    SafeArea(
                      child: RaisedButton(
                          elevation: 10,
                          onPressed: submitData,
                          color: Colors.purple,
                          child: Container(
                            width: 105,
                            child: FittedBox(
                              child: Text(
                                'Add Transaction',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
