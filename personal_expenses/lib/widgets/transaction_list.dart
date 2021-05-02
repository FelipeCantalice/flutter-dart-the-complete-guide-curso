import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String id) deleteTransaction;

  const TransactionList({
    Key? key,
    required this.transactions,
    required this.deleteTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                "Sem transações",
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: Image.asset(
                  "assets/image/waiting.png",
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, i) {
              final transaction = transactions[i];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: FittedBox(
                        child: Text("R\$: ${transaction.amount}"),
                      ),
                    ),
                  ),
                  title: Text(
                    transaction.title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(transaction.data),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteTransaction(transaction.id),
                    color: Colors.red,
                  ),
                ),
              );
            },
          );
  }
}
