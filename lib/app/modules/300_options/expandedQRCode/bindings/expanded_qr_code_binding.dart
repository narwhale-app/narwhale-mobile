import 'package:get/get.dart';

import '../controllers/expanded_qr_code_controller.dart';

class ExpandedQRCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpandedQRCodeController>(
      () => ExpandedQRCodeController(),
    );
  }
}
