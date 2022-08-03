import 'package:get/get.dart';
import 'package:narwhale_mobile/app/models/CryptoContainerModel.dart';
import 'package:narwhale_mobile/app/models/TransactionsModels.dart';

class WalletInfoTransactionInputsController extends GetxController {
  final SWalletModel walletItem;
  final SCryptoTransactionModel transaction;

  WalletInfoTransactionInputsController({required this.walletItem, required this.transaction});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}