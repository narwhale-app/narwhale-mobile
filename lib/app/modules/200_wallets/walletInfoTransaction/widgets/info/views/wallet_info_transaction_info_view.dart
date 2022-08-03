import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:narwhale_mobile/app/models/CryptoContainerModel.dart';
import 'package:narwhale_mobile/app/modules/200_wallets/walletInfoAddress/widgets/details/widgets/WalletInfoAddressDetailsList.dart';
import 'package:narwhale_mobile/app/widgets/LightButton.dart';
import 'package:narwhale_mobile/app/widgets/slidingUpPanel/SlidingUpPanelController.dart';
import 'package:narwhale_mobile/services/CServices.dart';
import '../../SignTransactionView.dart';
import '../controllers/wallet_info_transaction_info_controller.dart';

class WalletInfoTransactionInfoView extends GetView<WalletInfoTransactionInfoController> {
  final SlidingUpPanelController _slidingUpPanelController;
  final WalletInfoTransactionInfoController _controller;

  WalletInfoTransactionInfoView({
    required WalletInfoTransactionInfoController controller,
    required SlidingUpPanelController slidingUpPanelController
  }): _controller = controller, _slidingUpPanelController = slidingUpPanelController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: getTopTitle()
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 15, right: 15),
          child: getAddressPanel(context)
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.only(left: 15, right: 15),
          child: getDetailsPanel()
        )
      ]
    );
  }

  Widget getTopTitle() {
    return Row(
      children: [
        Expanded(
          child: Text('Unnamed transaction', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ),
        getEditButton()
      ]
    );
  }

  Widget getEditButton() {
    return InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
            width: 50,
            height: 45,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 5),
            child: SvgPicture.asset('assets/icons/edit.svg', color: Colors.white, height: 30)
        )
    );
  }

  Widget getAddressPanel(BuildContext context) {
    return Column(
      children: [
        Text(_controller.transactionID),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: getCopyAddress(context)
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: getSignTransaction(context)
        )
      ]
    );
  }

  Widget getCopyAddress(BuildContext context) {
    return LightButton(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: SvgPicture.asset('assets/icons/content_copy.svg', color: Colors.white),
        ),
        Text('COPY', style: TextStyle(color: Colors.white))
      ],
    ), onTap: () {
      copyAddress(context);
    });
  }

  Widget getSignTransaction(BuildContext context) {
    return LightButton(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: SvgPicture.asset('assets/icons/content_copy.svg', color: Colors.white),
        ),
        Text('Sign', style: TextStyle(color: Colors.white))
      ],
    ), onTap: () {
      var sign = _controller.signTransaction(context);
      _slidingUpPanelController.open(SignTransactionView(sign: sign));
    });
  }

  Widget getDetailsPanel() {
    return WalletInfoAddressDetailsList(
        list: _controller.list
    );
  }

  void copyAddress(BuildContext context) {
    Clipboard.setData(ClipboardData(text: _controller.transactionID));
    CServices.notify.addNotify(context, 'Transaction ID copied');
  }
}