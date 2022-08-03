import 'package:flutter/material.dart';
import 'package:narwhale_mobile/app/widgets/qrCode/QRCodeGenerator.dart';
import 'package:narwhale_mobile/app/widgets/qrCode/QRCodeView.dart';

class SignTransactionView extends StatelessWidget {
  final String sign;
  SignTransactionView({required this.sign});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Center(
        child: Container(
          child: QRCodeGenerator(data: sign, maxChunkSize: 0)
        )
      )
    );
  }

}