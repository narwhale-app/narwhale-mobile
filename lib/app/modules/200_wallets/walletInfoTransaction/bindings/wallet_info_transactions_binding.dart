import 'package:get/get.dart';
import 'package:narwhale_mobile/app/widgets/slidingUpPanel/SlidingUpPanelController.dart';

import '../controllers/wallet_info_transactions_controller.dart';

class WalletInfoTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletInfoTransactionController>(
      () => WalletInfoTransactionController(),
    );

    Get.create<SlidingUpPanelController>(() => SlidingUpPanelController());
  }
}
