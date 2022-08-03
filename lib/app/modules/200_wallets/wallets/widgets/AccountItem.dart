import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:narwhale_mobile/app/models/TransactionsModels.dart';
import 'package:narwhale_mobile/services/CServices.dart';

import '../../../../../utils.dart';

class AccountItem extends StatelessWidget {
  final String walletKey;

  AccountItem({
    required this.walletKey
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: getOperationsList(context),
            )
          ]
        ),
      ),
    );
  }

  Widget getOperationsList(BuildContext context) {
    List<Widget> rows = [];
    List<SCryptoTransactionModel> transactions = CServices.crypto.controlTransactionsService.getWalletTransactions(walletKey);

    Color textColor = Theme.of(context).accentColor;

    transactions.forEach((transaction) {
      String info = '';
      transaction.outputs.forEach((point) {
        if (info.isNotEmpty) {
          info += '\n';
        }
        info += 'send ' + Utils.formatBTC(point.value);
      });

      var dt = DateTime.fromMicrosecondsSinceEpoch(transaction.addTime * 1000);
      String date = DateFormat('yyyy-MM-dd kk:mm').format(dt);

      rows.add(Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: rows.isEmpty?5:1),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(date, style: TextStyle(fontSize: 14, color: textColor))
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(info, textAlign: TextAlign.right, softWrap: true, style: TextStyle(fontSize: 14, color: textColor))
              )
            )
          ]
        )
      ));
    });

    return Column(
      children: rows
    );
  }
}