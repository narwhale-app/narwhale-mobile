import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:narwhale_mobile/app/widgets/LightButton.dart';
import 'package:narwhale_mobile/app/widgets/qrCode/QRCodeGenerator.dart';
import 'package:narwhale_mobile/app/widgets/qrCode/QRCodeView.dart';
import 'package:narwhale_mobile/services/CServices.dart';

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
          child: Column(
            children: [
              QRCodeGenerator(data: sign, maxChunkSize: 0),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: LightButton(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset('assets/icons/content_copy.svg', color: Colors.white),
                    ),
                    Text('COPY', style: TextStyle(color: Colors.white))
                  ],
                ), onTap: () {
                  Clipboard.setData(ClipboardData(text: sign));
                  CServices.notify.addNotify(context, 'Sign copied');
                })
              )
            ]
          )
        )
      )
    );
  }

}