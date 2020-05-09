import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transaction_page.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // final TransactionPage txPage;
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraint) {
              return Column(
                children: <Widget>[
                  SizedBox(height: constraint.maxHeight * 0.10),
                  Container(
                    margin: EdgeInsets.only(top: constraint.maxHeight * 0.05),
                    width: constraint.maxHeight * 0.3,
                    child: Image.asset('assets/images/empty.png'),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, ind) {
              return Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      ctx,
                      MaterialPageRoute(
                        builder: (ctx) => TransactionPage(transactions[ind]),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                          child: Text('\$${transactions[ind].amount}')),
                    ),
                  ),
                  title: Text(transactions[ind].title,
                      style: Theme.of(context).textTheme.title),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(transactions[ind].date),
                  ),
                  trailing: IconButton(
                    icon:
                        Icon(Icons.delete, color: Theme.of(context).errorColor),
                    onPressed: () => deleteTx(transactions[ind].id),
                  ),
                ),
              );
            },
          );
  }
}
