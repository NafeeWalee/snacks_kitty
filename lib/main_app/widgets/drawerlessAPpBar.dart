
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure_snackskitty/main_app/utils/controller/sizeConfig.dart';

class DrawerLessAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget? widget;
  DrawerLessAppBar({
    this.widget
  });

  final GetSizeConfig sizeConfig = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            Get.back();
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,)
      ),
      actions: [
        widget == null ? SizedBox() :
        widget!
      ],
    );
  }

  @override
  Size get preferredSize => Size(sizeConfig.width*1000, sizeConfig.height*70);
}
