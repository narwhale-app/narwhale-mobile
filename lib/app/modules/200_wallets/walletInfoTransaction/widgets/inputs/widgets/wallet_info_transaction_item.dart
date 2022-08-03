import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:narwhale_mobile/app/models/CryptoContainerModel.dart';
import 'package:narwhale_mobile/app/models/TransactionsModels.dart';
import 'package:narwhale_mobile/services/CServices.dart';

import '../../../../../../../utils.dart';

class WalletInfoTransactionItem extends StatelessWidget {
  final SCryptoTransactionPoint transactionPoint;
  WalletInfoTransactionItem({required this.transactionPoint});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: openItem,
          splashColor: Colors.transparent,
          child: Container(
              decoration: BoxDecoration(
                  color: Utils.hexToColor('#202A40'),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: getContent()
          )
      ),
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
              )
          ),
          Container(
              child: getRightArrow()
          )
        ]
    );
  }

  Widget getTopPanel() {
    SWalletModel? walletItem;
    try {
      walletItem = CServices.crypto.controlWalletsService.getWalletByKey(transactionPoint.walletKey);
    } catch(e) {;;};

    String title = '';
    if (walletItem == null) {
      title = 'Wallet not found';
    } else {
      title = walletItem.name;
    }

    TextStyle style = TextStyle(color: Colors.white);
    return Row(
        children: [
          Expanded(
            child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(title, style: style)
            ),
          ),
          Container(
              child: Text(Utils.formatBTC(transactionPoint.value), style: style)
          )
        ]
    );
  }

  Widget getBottomPanel() {
    TextStyle style = TextStyle(color: Colors.white.withOpacity(0.5));
    return Container(
        child: Text(transactionPoint.address, style: style)
    );
  }

  Widget getRightArrow() {
    return Container(
        margin: EdgeInsets.only(left: 10),
        child: SvgPicture.asset('assets/icons/content_copy.svg', color: Colors.white)
    );
  }

  void openItem() {
  }
}