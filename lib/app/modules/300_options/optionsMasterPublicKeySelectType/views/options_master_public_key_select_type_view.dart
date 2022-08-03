import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:narwhale_mobile/app/routes/app_pages.dart';
import 'package:narwhale_mobile/app/widgets/TopSide.dart';

import '../controllers/options_master_public_key_select_type_controller.dart';

class OptionsMasterPublicKeySelectTypeView extends GetView<OptionsMasterPublicKeySelectTypeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopSide(
              title: controller.getPageTitle(),
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
    List<Widget> rows = [];
    controller.paths.forEach((pathItem) {
      rows.add(Container(
        child: getMenuItem(pathItem.title, path: pathItem.path, onTap: () {
          Get.toNamed(Routes.OPTIONS_VIEW_PUBLIC_KEY, arguments: {
            'path': pathItem.path
          });
        })
      ));
    });

    return Column(
      children: rows
    );
  }
  
  Widget getMenuItem(String title, {required String path, required GestureTapCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF202A40),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(title, style: TextStyle(fontSize: 14, color: Color(0xFFF9F9F9)))
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(path, style: TextStyle(fontSize: 14, color: Color(0xFFC0CAD7)))
                )
              ],
            ),
            Container(
              child: Icon(CupertinoIcons.chevron_forward, color: Color(0xFFC0CAD7)),
            )
          ]
        )
      ),
    );
  }
}
