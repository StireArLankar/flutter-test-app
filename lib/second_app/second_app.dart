import 'package:flutter/material.dart';

import './transaction_form.dart';
import './chart.dart';
import './transaction.model.dart';
import './transactions_list.dart';

class SecondApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transactions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];

  void _onTransactionDelete(String id) =>
      setState(() => _transactions.removeWhere((trans) => trans.id == id));

  void _addTransaction(
      {@required String title,
      @required double amount,
      @required DateTime date}) {
    final newTrans = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );

    setState(() => _transactions.add(newTrans));
  }

  void _openModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => GestureDetector(
        onTap: () {},
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: TransactionForm(_addTransaction),
        ),
        behavior: HitTestBehavior.opaque,
      ),
      backgroundColor: Colors.transparent,
    );
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((trans) {
      return trans.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionsList(_transactions, _onTransactionDelete),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle_outline),
        onPressed: () => _openModal(context),
      ),
    );
  }
}
