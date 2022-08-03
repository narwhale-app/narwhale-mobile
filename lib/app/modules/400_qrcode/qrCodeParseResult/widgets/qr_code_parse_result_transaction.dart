import 'package:flutter/material.dart';
import 'package:narwhale_mobile/app/models/CryptoContainerModel.dart';
import 'package:narwhale_mobile/app/models/TransactionsModels.dart';
import 'package:narwhale_mobile/app/modules/400_qrcode/qrCodeParseResult/controllers/qr_code_parse_result_controller.dart';
import 'package:narwhale_mobile/app/widgets/LightButton.dart';
import 'package:narwhale_mobile/app/widgets/qrCode/QRCodeScanner.dart';
import 'package:narwhale_mobile/services/CServices.dart';

class QRCodeParseResultTransaction extends StatelessWidget {
  final QRCodeParseResultController controller;
  final QRCodeScannerResultParseTransaction qrCode;

  QRCodeParseResultTransaction({
    required this.controller,
    required this.qrCode
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: getContent(context)
            )
          )
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: getControlArea(context)
        )
      ]
    );
  }

  Widget getContent(BuildContext context) {
    SCryptoTransactionModel transaction = qrCode.preprocessData as SCryptoTransactionModel;

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Transaction fee: ' + transaction.fee.toString()),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Inputs', style: TextStyle(fontWeight: FontWeight.bold))
        ),
        Container(
          margin: EdgeInsets.only(top: 3),
          child: getTransactionPointsArea(transaction.inputs),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Outputs', style: TextStyle(fontWeight: FontWeight.bold))
        ),
        Container(
          margin: EdgeInsets.only(top: 3),
          child: getTransactionPointsArea(transaction.outputs),
        ),
        Container(
          margin: EdgeInsets.only(top: 3),
          child: getTransactionPointsArea(transaction.outputs),
        )
      ]
    );
  }

  Widget getControlArea(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: getSignButton(context)
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 15),
          child: getCancelButton(context)
        )
      ]
    );
  }

  Widget getSignButton(BuildContext context) {
    return LightButton(isInline: true, onTap: controller.acceptAction, child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('SIGN', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
      ]
    ));
  }

  Widget getCancelButton(BuildContext context) {
    return LightButton(isInline: true, onTap: controller.cancelAction, style: LightButtonStyle.SECONDARY, child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('CANCEL', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF4A90E2), fontWeight: FontWeight.bold))
      ]
    ));
  }

  Widget getTransactionPointsArea(List<SCryptoTransactionPoint> points) {
    List<Widget> rows = [];
    points.forEach((point) {
      String walletName = '?';
      if (point.walletKey.isNotEmpty) {
        SWalletModel walletItem = CServices.crypto.controlWalletsService.getWalletByKey(point.walletKey);
        walletName = walletItem.name;
      }

      rows.add(Container(
        child: Text(walletName + ' -> ' + point.value.toString())
      ));
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows
    );
  }
}