import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:narwhale_mobile/app/modules/300_options/optionsMasterPublicKeySelectType/controllers/options_master_public_key_select_type_controller.dart';
import 'package:narwhale_mobile/app/routes/app_pages.dart';
import 'package:narwhale_mobile/app/widgets/TopSide.dart';

import '../controllers/options_master_public_key_controller.dart';

class OptionsMasterPublicKeyView extends GetView<OptionsMasterPublicKeyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopSide(
              title: 'Master Public Key',
              titleType: TOP_SIDE_TITLE_TYPE.NONE,
              menuType: TOP_SIDE_MENU_TYPE.NONE,
              openMenu: () {
              }
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: getMenuArea()
            )
          ]
        )
      )
    );
  }

  Widget getMenuArea() {
    return Column(
      children: [
        Container(
          child: getMenuItem('Single key', onTap: () {
            Get.toNamed(Routes.OPTIONS_MASTER_PUBLIC_KEY_SELECT_TYPE, arguments: {
              'type': OptionsMasterPublicKeyType.SINGLE_KEY
            });
          })
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: getMenuItem('Multisig', onTap: () {
            Get.toNamed(Routes.OPTIONS_MASTER_PUBLIC_KEY_SELECT_TYPE, arguments: {
              'type': OptionsMasterPublicKeyType.MULTI_SIG
            });
          })
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: getMenuItem('Custom derivation', onTap: () {

          })
        )
      ]
    );
  }
  
  Widget getMenuItem(String title, {required GestureTapCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF202A40),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFFF9F9F9))),
            Container(
              child: Icon(CupertinoIcons.chevron_forward, color: Color(0xFFC0CAD7))
            )
          ]
        )
      ),
    );
  }
}
