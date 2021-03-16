
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure_snackskitty/main_app/resources/appConst.dart';
import 'package:pure_snackskitty/main_app/utils/controller/sizeConfig.dart';

class CustomTab extends StatelessWidget {

  final GetSizeConfig sizeConfig = Get.find();

  final bool isActive;
  final String label;
  CustomTab({
    required this.isActive,
    required this.label
});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: sizeConfig.width * 25),
      decoration: BoxDecoration(
        color: isActive ? AppConst.green : AppConst.white,
        borderRadius: BorderRadius.circular(sizeConfig.width*20),
        // border: Border.all(
        //   color: isActive ? Colors.transparent : Color(0xff9C9CA6)
        // )
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? AppConst.white : Color(0xff9C9CA6),
          fontWeight: FontWeight.bold,
          fontSize: sizeConfig.getPixels(14)
        ),
      ),
    );
  }
}
