import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:narwhale_mobile/app/models/TransactionsModels.dart';
import '../controllers/wallet_info_transaction_inputs_controller.dart';

import '../widgets/wallet_info_transaction_item.dart';

class WalletInfoTransactionInputsView extends GetView<WalletInfoTransactionInputsController> {
  final WalletInfoTransactionInputsController _controller;

  WalletInfoTransactionInputsView({
    required WalletInfoTransactionInputsController controller
  }): _controller = controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _controller.transaction.inputs.length,
        itemBuilder: (context, index) {
          SCryptoTransactionPoint transactionPoint = _controller.transaction.inputs[index];
          return Container(
              margin: EdgeInsets.only(top: (index == 0)?10:10, left: 15, right: 15),
              child: WalletInfoTransactionItem(transactionPoint: transactionPoint)
          );
        }
    );
  }
}