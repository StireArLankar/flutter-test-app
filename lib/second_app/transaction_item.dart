import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.model.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;
  final Function(String) _onDelete;

  TransactionItem(this._transaction, this._onDelete);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${_transaction.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          _transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(_transaction.date),
        ),
        trailing: Ink(
          decoration: ShapeDecoration(
            color: Theme.of(context).errorColor,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(
              Icons.delete,
            ),
            color: Theme.of(context).textTheme.button.color,
            onPressed: () => _onDelete(_transaction.id),
          ),
        ),
      ),
    );
  }
}
