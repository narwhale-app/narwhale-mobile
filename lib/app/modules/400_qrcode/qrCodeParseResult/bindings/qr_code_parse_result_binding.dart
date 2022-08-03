import 'package:get/get.dart';

import '../controllers/qr_code_parse_result_controller.dart';

class QRCodeParseResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QRCodeParseResultController>(
      () => QRCodeParseResultController(),
    );
  }
}
