import 'package:get/get.dart';
import 'package:narwhale_mobile/app/models/CryptoContainerModel.dart';
import 'package:narwhale_mobile/app/models/TransactionsModels.dart';
import 'package:narwhale_mobile/app/modules/200_wallets/walletInfoTransaction/widgets/info/controllers/wallet_info_transaction_info_controller.dart';
import 'package:narwhale_mobile/app/modules/200_wallets/walletInfoTransaction/widgets/inputs/controllers/wallet_info_transaction_inputs_controller.dart';
import 'package:narwhale_mobile/app/modules/200_wallets/walletInfoTransaction/widgets/outputs/controllers/wallet_info_transaction_outputs_controller.dart';
import 'package:narwhale_mobile/services/CServices.dart';

enum WALLET_INFO_TRANSACTIONS_TAB {
  INFO,
  INPUTS,
  OUTPUTS
}

class WalletInfoTransactionController extends GetxController {
  var currentTab = WALLET_INFO_TRANSACTIONS_TAB.INFO.obs;

  final String walletKey = Get.arguments['walletKey'];
  final SCryptoTransactionModel transaction = Get.arguments['transaction'];

  SWalletModel? walletItem;

  WalletInfoTransactionInfoController? walletInfoTransactionInfoController;
  WalletInfoTransactionInputsController? walletInfoTransactionInputsController;
  WalletInfoTransactionOutputsController? walletInfoTransactionOutputsController;

  @override
  void onInit() {
    super.onInit();

    walletItem = CServices.crypto.controlWalletsService.getWalletByKey(walletKey);
    walletInfoTransactionInfoController ??= Get.put(WalletInfoTransactionInfoController(
      walletItem: walletItem!,
      transaction: transaction
    ));
    walletInfoTransactionInputsController ??= Get.put(WalletInfoTransactionInputsController(
      walletItem: walletItem!,
      transaction: transaction
    ));
    walletInfoTransactionOutputsController ??= Get.put(WalletInfoTransactionOutputsController(
      walletItem: walletItem!,
      transaction: transaction
    ));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setCurrentTab(String key) {
    var val = getTabKey(key);
    currentTab.value = val!;
  }

  WALLET_INFO_TRANSACTIONS_TAB? getTabKey(String key) {
    switch(key) {
      case 'WALLET_INFO_TRANSACTIONS_TAB.INFO': return WALLET_INFO_TRANSACTIONS_TAB.INFO;
      case 'WALLET_INFO_TRANSACTIONS_TAB.INPUTS': return WALLET_INFO_TRANSACTIONS_TAB.INPUTS;
      case 'WALLET_INFO_TRANSACTIONS_TAB.OUTPUTS': return WALLET_INFO_TRANSACTIONS_TAB.OUTPUTS;
    }
  }
}
