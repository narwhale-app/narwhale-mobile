import 'package:get/get.dart';

import '../controllers/options_master_public_key_controller.dart';

class OptionsMasterPublicKeyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionsMasterPublicKeyController>(
      () => OptionsMasterPublicKeyController(),
    );
  }
}
