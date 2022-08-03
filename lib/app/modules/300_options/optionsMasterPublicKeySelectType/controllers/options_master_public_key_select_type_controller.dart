import 'package:get/get.dart';

enum OptionsMasterPublicKeyType {
  SINGLE_KEY,
  MULTI_SIG
}

class MasterKeyPathItem {
  String title;
  String path;

  MasterKeyPathItem({
    required this.title,
    required this.path
  });
}

class OptionsMasterPublicKeySelectTypeController extends GetxController {
  OptionsMasterPublicKeyType type = Get.arguments['type'];

  List<MasterKeyPathItem> paths = [];

  @override
  void onInit() {
    super.onInit();

    initPaths();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void initPaths() {
    paths.add(MasterKeyPathItem(title: 'Native Segwit', path: 'm/84h/2h/0h'));
    paths.add(MasterKeyPathItem(title: 'Nested Segwit', path: 'm/49h/2h/0h'));
    paths.add(MasterKeyPathItem(title: 'Taproot', path: 'm/49h/2h/0h'));
  }

  String getPageTitle() {
    switch(type) {
      case OptionsMasterPublicKeyType.SINGLE_KEY: {
        return 'Single key';
      }
      case OptionsMasterPublicKeyType.MULTI_SIG:
        return 'Multisig';
    }
  }
}
