import 'package:get/get.dart';

class ExpandedQRCodeController extends GetxController {
  String? data;

  @override
  void onInit() {
    super.onInit();

    data = Get.arguments['data'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
