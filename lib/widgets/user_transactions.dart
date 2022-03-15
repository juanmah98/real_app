import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'Nueva remera', monto: 1500, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'Supermercado', monto: 1100.50, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txMonto) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        monto: txMonto,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}
