import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:narwhale_mobile/app/modules/200_wallets/walletInfoTransaction/widgets/info/controllers/wallet_info_transaction_info_controller.dart';
import 'package:narwhale_mobile/app/widgets/LightTab.dart';
import 'package:narwhale_mobile/app/widgets/TopSide.dart';
import 'package:narwhale_mobile/app/widgets/slidingUpPanel/SlidingUpPanelController.dart';
import 'package:narwhale_mobile/app/widgets/slidingUpPanel/SlidingUpPanelView.dart';
import '../controllers/wallet_info_transactions_controller.dart';

import '../widgets/info/views/wallet_info_transaction_info_view.dart';
import '../widgets/inputs/views/wallet_info_transaction_inputs_view.dart';
import '../widgets/outputs/views/wallet_info_transaction_outputs_view.dart';

class WalletInfoTransactionView extends GetView<WalletInfoTransactionController> {
  final SlidingUpPanelController _slidingUpPanelController = Get.find<SlidingUpPanelController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SlidingUpPanelView(
            controller: _slidingUpPanelController,
            body: getBody()
        )
    );
  }

  Widget getBody() {
    return SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopSide(
                  title: 'Transaction details',
                  titleType: TOP_SIDE_TITLE_TYPE.TRANSACTION,
                  menuType: TOP_SIDE_MENU_TYPE.NONE,
                  openMenu: () {
                    print('openMenu');
                  }
              ),
              Expanded(
                  child: getContent()
              )
            ]
        )
    );
  }

  Widget getBackButton() {
    return InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          //color: Colors.grey,
            width: 50,
            height: 45,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 5),
            child: Icon(CupertinoIcons.left_chevron, size: 26)
        )
    );
  }

  Widget getMenuButton() {
    return InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          //color: Colors.grey,
            width: 50,
            height: 45,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 5),
            child: SvgPicture.asset('assets/icons/edit.svg', color: Colors.white, height: 30)
        )
    );
  }

  Widget getContent() {
    return Obx(() => Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: LightTab(
              tabs: [
                LightTabNode('Information', key: WALLET_INFO_TRANSACTIONS_TAB.INFO.toString()),
                LightTabNode('Inputs', key: WALLET_INFO_TRANSACTIONS_TAB.INPUTS.toString()),
                LightTabNode('Outputs', key: WALLET_INFO_TRANSACTIONS_TAB.OUTPUTS.toString())
              ],
              tabKey: controller.currentTab.toString(),
              onSelect: (String key) {
                controller.setCurrentTab(key);
              }
            ),
          ),
          Expanded(
            child: getTabContent()
          )
        ]
      )
    ));
  }

  Widget getTabContent() {
    switch(controller.currentTab.value) {
      case WALLET_INFO_TRANSACTIONS_TAB.INFO:
        return WalletInfoTransactionInfoView(controller: controller.walletInfoTransactionInfoController!, slidingUpPanelController: _slidingUpPanelController);
      case WALLET_INFO_TRANSACTIONS_TAB.INPUTS:
        return WalletInfoTransactionInputsView(controller: controller.walletInfoTransactionInputsController!);
      case WALLET_INFO_TRANSACTIONS_TAB.OUTPUTS:
        return WalletInfoTransactionOutputsView(controller: controller.walletInfoTransactionOutputsController!);
    }
  }
}
