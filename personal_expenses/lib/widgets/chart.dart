import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:personal_expenses/models/transaction.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({
    Key? key,
    required this.recentTransactions,
  }) : super(key: key);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDate = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].data.day == weekDate.day &&
            recentTransactions[i].data.month == weekDate.month &&
            recentTransactions[i].data.year == weekDate.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekDate), 'amount': totalSum};
    });
  }

  double get maxSpending {
    return groupedTransactions.fold(
      0.0,
      (sum, item) => sum + (item['amount'] as double),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var ts in groupedTransactions) ...{
              Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: ts['day'] as String,
                  spending: (ts['amount'] as double),
                  percentange: maxSpending == 0.0
                      ? 0.0
                      : (ts['amount'] as double) / maxSpending,
                ),
              )
            },
          ],
        ),
      ),
    );
  }
}
