import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:narwhale_mobile/services/cryptoService/providers/CCryptoProvider.dart';
import 'package:narwhale_mobile/utils.dart';
import '../controllers/wallet_info_details_controller.dart';

class WalletInfoDetailsView extends GetView<WalletInfoDetailsController> {
  final WalletInfoDetailsController _controller;

  WalletInfoDetailsView({required WalletInfoDetailsController controller}): _controller = controller;

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    _controller.list.forEach((node) {
      rows.add(Container(
        margin: EdgeInsets.only(top: rows.isEmpty?0:5),
        child: WalletInfoDetailsItem(node)
      ));
    });

    rows.add(Container(
      margin: EdgeInsets.only(top: 20),
      child: Text('Keys')
    ));

    rows.add(Container(
      margin: EdgeInsets.only(top: 10),
      child: getKeysArea()
    ));

    return Container(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rows
      )
    );
  }

  Widget getKeysArea() {
    List<Widget> rows = [];

    controller.walletItem.descriptor.keys.forEach((SWalletKey walletKey) {
      rows.add(Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Utils.hexToColor('#202A40'),
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text('Derivation: ' + walletKey.getDerivationPath()),
            ),
            Container(
              child: Text('Fingerprint: ' + walletKey.getFingerprint()),
            )
          ]
        )
      ));
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows
    );
  }
}

class WalletInfoDetailsItem extends StatelessWidget {
  final WalletInfoDetailsNode node;
  WalletInfoDetailsItem(this.node);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(node.name),
        ),
        Container(
          child: Text(node.value)
        )
      ]
    );
  }
}