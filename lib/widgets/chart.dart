import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTracsaction;

  Chart(this.recentTracsaction);

  List<Map<String, Object>> get gropuedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTracsaction.length; i++) {
        if (recentTracsaction[i].date.day == weekDay.day &&
            recentTracsaction[i].date.month == weekDay.month &&
            recentTracsaction[i].date.year == weekDay.year) {
          totalSum += recentTracsaction[i].monto;
        }
      }
      // print(DateFormat.E().format(weekDay));
      // print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'monto': totalSum
      };
    });
  }

  double get totalSpending {
    return gropuedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['monto'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(gropuedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: gropuedTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'],
                    data['monto'],
                    totalSpending == 0.0
                        ? 0.0
                        : (data['monto'] as double) / totalSpending),
              );
            }).toList()),
      ),
    );
  }
}
