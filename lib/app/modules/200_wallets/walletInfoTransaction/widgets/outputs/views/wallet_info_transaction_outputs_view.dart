import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:narwhale_mobile/app/models/TransactionsModels.dart';
import '../controllers/wallet_info_transaction_outputs_controller.dart';

import '../../inputs/widgets/wallet_info_transaction_item.dart';

class WalletInfoTransactionOutputsView extends GetView<WalletInfoTransactionOutputsController> {
  final WalletInfoTransactionOutputsController _controller;

  WalletInfoTransactionOutputsView({
    required WalletInfoTransactionOutputsController controller
  }): _controller = controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _controller.transaction.outputs.length,
        itemBuilder: (context, index) {
          SCryptoTransactionPoint transactionPoint = _controller.transaction.outputs[index];
          return Container(
              margin: EdgeInsets.only(top: (index == 0)?10:10, left: 15, right: 15),
              child: WalletInfoTransactionItem(transactionPoint: transactionPoint)
          );
        }
    );
  }
}