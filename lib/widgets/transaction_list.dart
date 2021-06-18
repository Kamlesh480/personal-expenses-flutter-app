import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTX;

  TransactionList(this.transaction, this.deleteTX);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Entry added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/Images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView(
            children: transaction
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTX: deleteTX,
                    ))
                .toList(),
          );
  }
}
