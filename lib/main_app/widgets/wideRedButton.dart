
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure_snackskitty/main_app/resources/appConst.dart';
import 'package:pure_snackskitty/main_app/utils/controller/sizeConfig.dart';


class WideRedButton extends StatelessWidget {
  final GetSizeConfig sizeConfig = Get.find();
  final String label;
  final Color? color;
  final Function onPressed;
  WideRedButton({
    required this.label,
    required this.onPressed,
    this.color
});
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: sizeConfig.getPixels(45),
        minWidth: double.infinity,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color ?? AppConst.pink,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(sizeConfig.width* 15)
          ),
        ),
        onPressed: onPressed as void Function()?,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: sizeConfig.getPixels(20),
                fontFamily: 'Robot-M',
                color: color == null ? Colors.white : AppConst.pink
            ),
          ),
        ),
      ),
    );
  }
}
