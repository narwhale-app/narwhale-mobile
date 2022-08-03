import 'dart:async';

import 'package:get/get.dart';
import 'package:narwhale_mobile/app/widgets/qrCode/QRCodeScanner.dart';

class QRCodeParseResultArguments {
  final QRCodeScannerResult qrCodeScannerResult;
  final Completer<void> completer;
  final Function onProcess;

  QRCodeParseResultArguments({
    required this.qrCodeScannerResult,
    required this.completer,
    required this.onProcess
  });
}

class QRCodeParseResultController extends GetxController {
  late QRCodeParseResultArguments _arguments;

  late QRCodeScannerTypes _qrCodeScannerType;

  @override
  void onInit() {
    super.onInit();

    _arguments = Get.arguments as QRCodeParseResultArguments;
    _qrCodeScannerType = _arguments.qrCodeScannerResult.qrCodeType;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    if (!_arguments.completer.isCompleted) {
      _arguments.completer.complete();
    }
  }

  QRCodeScannerResult getQRCodeScannerResult() {
    return _arguments.qrCodeScannerResult;
  }

  String getTopTitle() {
    switch(_qrCodeScannerType) {
      case QRCodeScannerTypes.PARSE_TRANSACTION:
        return 'Transaction';
      default:
        return 'Unknown';
    }
  }

  void acceptAction() {
    _arguments.onProcess();
    Get.back();
  }

  void cancelAction() {
    Get.back();
  }
}
