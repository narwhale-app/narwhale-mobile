import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:narwhale_mobile/app/widgets/TopSide.dart';
import 'package:narwhale_mobile/app/widgets/qrCode/QRCodeGenerator.dart';

import '../controllers/expanded_qr_code_controller.dart';

class ExpandedQRCodeView extends GetView<ExpandedQRCodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(context)
    );
  }
  
  Widget getBody(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopSide(
            title: 'QR Code',
            titleType: TOP_SIDE_TITLE_TYPE.NONE,
            menuType: TOP_SIDE_MENU_TYPE.NONE,
            openMenu: () {
            }
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: getContent(context)
            )
          )
        ]
      )
    );
  }

  Widget getContent(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: QRCodeGenerator(
          data: controller.data!,
          maxChunkSize: 0,
          canBeExpanded: false
        )
      )
    );
  }
}
