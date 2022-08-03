import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:narwhale_mobile/app/models/CryptoContainerModel.dart';
import 'package:narwhale_mobile/app/models/TransactionsModels.dart';
import 'package:narwhale_mobile/app/modules/400_qrcode/qrCodeParseResult/controllers/qr_code_parse_result_controller.dart';
import 'package:narwhale_mobile/app/widgets/LightButton.dart';
import 'package:narwhale_mobile/app/widgets/qrCode/QRCodeScanner.dart';
import 'package:narwhale_mobile/services/CServices.dart';
import 'package:narwhale_mobile/utils.dart';

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
        Container(
          child: getItemArea('Sending: ', Utils.formatBTC(transaction.getSendingAmount())),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: getItemArea('From wallet: ', getSendingWalletName(transaction)),
        ),

        /*Container(
          margin: EdgeInsets.only(top: 20),
          child: Text('From', style: TextStyle(fontWeight: FontWeight.bold))
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: getTransactionPointsArea(transaction),
        ),*/

        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text('To', style: TextStyle(fontWeight: FontWeight.bold))
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: getTransactionPointsArea(transaction, outPoints: true),
        ),

        Container(
          margin: EdgeInsets.only(top: 20),
          child: getItemArea('Transaction fee: ', Utils.formatBTC(transaction.fee)),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: getItemArea('The total withdrawal: ', Utils.formatBTC(transaction.getTotalWithdrawal())),
        )
      ]
    );
  }

  String getSendingWalletName(SCryptoTransactionModel transaction) {
    try {
      SWalletModel walletItem = CServices.crypto.controlWalletsService.getWalletByKey(transaction.getSendingWalletKey());
      return walletItem.name;
    } catch(e) {
      return '?';
    }
  }

  Widget getItemArea(String title, String value) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Text(title, style: TextStyle(fontWeight: FontWeight.bold))
        ),
        Container(
          child: Text(value, style: TextStyle(color: Color(0xFFC0CAD7)))
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

  Widget getTransactionPointsArea(SCryptoTransactionModel transaction, {bool outPoints = false}) {
    List<SCryptoTransactionPoint> points = outPoints?transaction.getOutPoints():transaction.getInPoints();

    List<Widget> rows = [];
    points.forEach((point) {
      rows.add(Container(
        margin: EdgeInsets.only(top: rows.isEmpty?0:15),
        child: getTransactionPointItem(point)
      ));
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows
    );
  }

  Widget getTransactionPointItem(SCryptoTransactionPoint point) {
    String walletName = '?';
    if (point.walletKey.isNotEmpty) {
      SWalletModel walletItem = CServices.crypto.controlWalletsService.getWalletByKey(point.walletKey);
      walletName = walletItem.name;
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF202A40),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: getItemArea('Sending:', Utils.formatBTC(point.value))
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: getItemArea('To:', point.address)
              )
            ]
          )
        )
      )
    );
  }
}