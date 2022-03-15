import 'package:flutter/cupertino.dart';

class Transaction {
  final String id;
  final String title;
  final double monto;
  final DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.monto,
      @required this.date});
}
