import 'package:flutter/material.dart';
import 'package:narwhale_mobile/app/models/CryptoContainerModel.dart';
import 'package:narwhale_mobile/app/models/TransactionsModels.dart';
import 'package:narwhale_mobile/services/CServices.dart';
import 'package:narwhale_mobile/services/cryptoService/CControlTransactionsService.dart';

import '../LightButton.dart';
import 'QRCodeScanner.dart';

class QRCodeView extends StatelessWidget {
  final QRCodeScannerResult qrCodeScannerResult;
  final Function onProcess;

  QRCodeView({
    required this.qrCodeScannerResult,
    required this.onProcess
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Text('QR Code found', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20),
            child: getQRCodeDescArea()
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 25),
            child: LightButton(isInline: false, onTap: onProcess, child: Text('Next', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)))
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            child: LightButton(isInline: false, style: LightButtonStyle.WHITE_OUTLINE, onTap: () {
              CServices.notify.closeDialog();
            }, child: Text('Cancel', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[700])))
          )
        ]
      )
    );
  }

  Widget getQRCodeDescArea() {
    switch(qrCodeScannerResult.qrCodeType) {
      case QRCodeScannerTypes.UNKNOWN:
        return Container();
      case QRCodeScannerTypes.ADD_WALLET_SIMPLE:
        QRCodeScannerResultAddWalletSimple qrCode = qrCodeScannerResult as QRCodeScannerResultAddWalletSimple;
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: getStatusLabel('name', qrCode.name)
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 5),
                child: getStatusLabel('desc', qrCode.descriptor)
              )
            ]
          )
        );
      case QRCodeScannerTypes.ADD_WALLET_JSON:
        QRCodeScannerResultAddWalletJSON qrCode = qrCodeScannerResult as QRCodeScannerResultAddWalletJSON;
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: getStatusLabel('label', qrCode.label)
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 5),
                child: getStatusLabel('block\nheight', qrCode.blockheight.toString())
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 5),
                child: getStatusLabel('desc', qrCode.descriptor)
              )
            ]
          )
        );
      case QRCodeScannerTypes.PARSE_TRANSACTION:
        QRCodeScannerResultParseTransaction qrCode = qrCodeScannerResult as QRCodeScannerResultParseTransaction;
        SCryptoTransactionModel transaction = qrCode.preprocessData as SCryptoTransactionModel;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Transaction', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: getTransactionArea(transaction)
            )/*,
            Container(
              child: Text(transaction.toString())
            )*/
          ]
        );
    }
  }

  Widget getTransactionArea(SCryptoTransactionModel transaction) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Fee: ' + transaction.fee.toString()),
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
        )
      ]
    );
  }

  Widget getTransactionPointsArea(List<SCryptoTransactionPoint> points) {
    List<Widget> rows = [];
    points.forEach((point) {
      String walletName = '';
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

  Widget getStatusLabel(String title, String info) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            minWidth: 50
          ),
          child: Text(title)
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(info)
          )
        )
      ]
    );
  }
}