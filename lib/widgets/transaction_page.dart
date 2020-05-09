import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionPage extends StatelessWidget {
  final Transaction transaction;

  TransactionPage(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("${transaction.date} : \$${transaction.amount}"),
      ),
    );
  }
}
