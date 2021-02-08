import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure.international.snackskitty.customer/main_app/utils/controller/sizeConfig.dart';


class AppBarText extends StatelessWidget {
  final String title;
  final Color color;
  AppBarText({
    @required this.title,
    this.color
});


  final GetSizeConfig sizeConfig = Get.find();

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color?? Colors.black,
        fontWeight: FontWeight.bold,
          fontSize: sizeConfig.getPixels(20)
      ),
    );
  }
}
