import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function(
      {@required String title,
      @required double amount,
      @required DateTime date}) _addTransaction;

  TransactionForm(this._addTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  String _title;
  final _amountController = TextEditingController();
  DateTime _date;

  String get dateText => _date == null
      ? 'No Date Chosen!'
      : 'Picked Date: ${DateFormat.yMd().format(_date)}';

  void _openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }

      setState(() => _date = date);
      FocusScope.of(context).requestFocus(new FocusNode());
    });
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final _amount = double.parse(_amountController.text);

    if (_title == null || _title == '' || _amount <= 0 || _date == null) {
      return;
    }

    widget._addTransaction(title: _title, amount: _amount, date: _date);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                      onChanged: (val) => setState(() => _title = val),
                      onSubmitted: (_) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Amount',
                      ),
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) {},
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(dateText),
                        ),
                        FlatButton(
                          textColor: Theme.of(context).primaryColor,
                          child: Text(
                            'Choose date',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: _openDatePicker,
                        )
                      ],
                    ),
                  ),
                  RaisedButton(
                    child: Text('Add transaction'),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: _submitData,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
