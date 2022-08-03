import 'package:get/get.dart';
import 'package:narwhale_mobile/app/models/CryptoContainerModel.dart';
import 'package:narwhale_mobile/app/models/TransactionsModels.dart';

class WalletInfoTransactionOutputsController extends GetxController {
  final SWalletModel walletItem;
  final SCryptoTransactionModel transaction;

  WalletInfoTransactionOutputsController({required this.walletItem, required this.transaction});

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