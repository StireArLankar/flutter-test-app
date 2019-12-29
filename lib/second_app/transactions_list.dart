import 'package:flutter/material.dart';

import './transaction_item.dart';
import './transaction.model.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function(String) _onDelete;

  TransactionsList(this._transactions, this._onDelete);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemBuilder: (ctx, index) =>
            TransactionItem(_transactions[index], _onDelete),
        itemCount: _transactions.length,
      ),
    );
  }
}
