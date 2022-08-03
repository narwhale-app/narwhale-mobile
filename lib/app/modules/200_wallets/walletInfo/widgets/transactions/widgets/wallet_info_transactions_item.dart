import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:narwhale_mobile/app/models/TransactionsModels.dart';
import 'package:narwhale_mobile/app/routes/app_pages.dart';

import '../../../../../../../utils.dart';

class WalletInfoTransactionsItem extends StatelessWidget {
  final SCryptoTransactionModel transaction;
  final String walletKey;

  WalletInfoTransactionsItem({
    required this.transaction, required this.walletKey
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: openItem,
        child: Container(
            decoration: BoxDecoration(
                color: Utils.hexToColor('#202A40'),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: getContent()
        )
    );
  }

  Widget getContent() {
    return Row(
        children: [
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: getTopPanel()
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: getBottomPanel()
                  )
                ]
            ),
          ),
          Container(
              child: getRightArrow()
          )
        ]
    );
  }

  Widget getTopPanel() {
    var dt = DateTime.fromMillisecondsSinceEpoch(transaction.addTime);
    String date = DateFormat('yyyy-MM-dd kk:mm').format(dt);

    String info = '';
    transaction.outputs.forEach((point) {
      if (info.isNotEmpty) {
        info += '\n';
      }
      info += 'send ' + Utils.formatBTC(point.value);
    });

    TextStyle style = TextStyle(color: Colors.white);
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(date, style: style)
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(info, textAlign: TextAlign.right, softWrap: true, style: style)
          )
        )
      ]
    );
  }

  Widget getBottomPanel() {
    TextStyle style = TextStyle(color: Colors.white.withOpacity(0.5));
    return Container(
        child: Text('Other info', style: style)
    );
  }

  Widget getRightArrow() {
    return Container(
        margin: EdgeInsets.only(left: 10),
        child: Icon(CupertinoIcons.right_chevron)
    );
  }

  void openItem() {
    Get.toNamed(Routes.WALLET_INFO_TRANSACTIONS, arguments: {
      'walletKey': walletKey,
      'transaction': transaction
    });
  }
}