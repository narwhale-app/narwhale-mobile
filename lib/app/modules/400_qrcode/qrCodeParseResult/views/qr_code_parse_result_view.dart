import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:narwhale_mobile/app/modules/400_qrcode/qrCodeParseResult/widgets/qr_code_parse_result_transaction.dart';
import 'package:narwhale_mobile/app/widgets/TopSide.dart';
import 'package:narwhale_mobile/app/widgets/qrCode/QRCodeScanner.dart';

import '../controllers/qr_code_parse_result_controller.dart';

class QRCodeParseResultView extends GetView<QRCodeParseResultController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody()
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopSide(
              title: controller.getTopTitle(),
              titleType: TOP_SIDE_TITLE_TYPE.NONE,
              menuType: TOP_SIDE_MENU_TYPE.NONE,
              openMenu: () {
              }
            ),
            Expanded(
              child: getContent()
            )
          ]
        ),
      )
    );
  }

  Widget getContent() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: QRCodeParseResultTransaction(
        controller: controller,
        qrCode: controller.getQRCodeScannerResult() as QRCodeScannerResultParseTransaction
      )
    );
  }
}
