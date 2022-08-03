import 'package:get/get.dart';
import 'package:narwhale_mobile/services/CServices.dart';
import 'package:narwhale_mobile/services/cryptoService/providers/CCryptoProvider.dart';

class OptionsViewPublicKeyController extends GetxController {
  String? path;
  @override
  void onInit() {
    super.onInit();

    path = Get.arguments['path'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  String getPublicKey() {
    return CServices.crypto.controlWalletsService.getPublicKey(path!);
  }
}
