import 'package:get/get.dart';

import '../controllers/options_view_public_key_controller.dart';

class OptionsViewPublicKeyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionsViewPublicKeyController>(
      () => OptionsViewPublicKeyController(),
    );
  }
}
