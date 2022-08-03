import 'package:get/get.dart';

import '../controllers/options_master_public_key_select_type_controller.dart';

class OptionsMasterPublicKeySelectTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionsMasterPublicKeySelectTypeController>(
      () => OptionsMasterPublicKeySelectTypeController(),
    );
  }
}
