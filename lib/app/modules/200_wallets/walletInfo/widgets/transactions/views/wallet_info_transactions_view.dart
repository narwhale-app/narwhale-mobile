import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:narwhale_mobile/app/models/CryptoContainerModel.dart';
import 'package:narwhale_mobile/app/models/TransactionsModels.dart';
import 'package:narwhale_mobile/app/widgets/DateSelector.dart';
import 'package:narwhale_mobile/app/widgets/LightFilter.dart';
import 'package:narwhale_mobile/services/CServices.dart';
import '../../../../../../../utils.dart';
import '../controllers/wallet_info_transactions_controller.dart';
import 'package:narwhale_mobile/app/widgets/LightTab.dart';

import '../widgets/wallet_info_transactions_item.dart';

class WalletInfoTransactionsView extends GetView<WalletInfoTransactionsController> {
  final WalletInfoTransactionsController _controller;
  final SWalletModel _walletItem;

  WalletInfoTransactionsView({
    required WalletInfoTransactionsController controller, required SWalletModel walletItem
  }): _controller = controller, _walletItem = walletItem;

  @override
  Widget build(BuildContext context) {
    return Container(child: getContent(context));
  }

  Widget getContent(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: LightTab(
              view: LightTabView.TOGGLE,
              tabs: [
                LightTabNode('HISTORY', key: WALLET_INFO_TRANSACTIONS_TAB.HISTORY.toString()),
                LightTabNode('UTXO', key: WALLET_INFO_TRANSACTIONS_TAB.UTXO.toString())
              ],
              tabKey: _controller.currentTab.toString(),
              onSelect: (String key) {
                _controller.setCurrentTab(key);
              }
            ),
          ),*/
          /*Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: getFilterPanel(context)
          ),*/
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 0),
              child: Obx(()=>getTabContent())
            )
          )
        ]
      )
    );
  }

  Widget getFilterPanel(BuildContext context) {
    Color backgroundColor = Utils.hexToColor('#202A40');
    Color activeIconColor = Utils.hexToColor('#0E1927');

    return LightFilter(
        onChange: (Map<String, String> filters) {
          print('filters: ' + filters.toString());
        },
        filters: [
          LightFilterItemModel(
              title: 'Sent',
              key: 'sent',
              iconColor: Utils.hexToColor('#70C098'),
              backgroundColor: backgroundColor,
              activeIconColor: activeIconColor,
              activeBackgroundColor: Utils.hexToColor('#65AD89'),
              icon: 'assets/icons/arrow-upload.svg'
          ),
          LightFilterItemModel(
              title: 'Received',
              key: 'received',
              iconColor: Utils.hexToColor('#9B99F5'),
              backgroundColor: backgroundColor,
              activeIconColor: activeIconColor,
              activeBackgroundColor: Utils.hexToColor('#8C8ADD'),
              icon: 'assets/icons/arrow-download.svg'
          ),
          LightFilterItemModel(
              title: 'Date',
              key: 'date',
              iconColor: Utils.hexToColor('#DAA970'),
              backgroundColor: backgroundColor,
              activeIconColor: activeIconColor,
              activeBackgroundColor: Utils.hexToColor('#C59865'),
              icon: 'assets/icons/business-calendar.svg',
              onSelect: () async {
                return selectFilterDate(context);
              }
          )
        ]
    );
  }

  Widget getTabContent() {
    switch(_controller.currentTab.value) {
      case WALLET_INFO_TRANSACTIONS_TAB.HISTORY: {
        List<SCryptoTransactionModel> txs = CServices.crypto.controlTransactionsService.getWalletTransactions(_walletItem.key);
        return ListView.builder(
          itemCount: txs.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: (index == 0)?10:10, left: 15, right: 15),
              child: WalletInfoTransactionsItem(transaction: txs[index], walletKey: _walletItem.key)
            );
          }
        );
      }
      case WALLET_INFO_TRANSACTIONS_TAB.UTXO: {
        return Center(
          child: Text('Will be soon')
        );
      }
    }
  }

  Future<String> selectFilterDate(BuildContext context) async {
    return await CServices.notify.addDialog(context, child: DateSelector());
  }
}