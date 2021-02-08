
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure.international.snackskitty.customer/main_app/resources/appConst.dart';
import 'package:pure.international.snackskitty.customer/main_app/utils/controller/sizeConfig.dart';


class WideWhiteButton extends StatelessWidget {
  final GetSizeConfig sizeConfig = Get.find();
  final String label;
  final Function onPressed;
  WideWhiteButton({
    @required this.label,
    @required this.onPressed
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeConfig.getPixels(45),
      width: double.infinity,
      child: OutlineButton(
        onPressed: onPressed,
        color: AppConst.pink,
        borderSide: BorderSide(
          color: AppConst.pink,
          width: 1.5
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(sizeConfig.width* 15)
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: sizeConfig.getPixels(20),
              fontFamily: 'Robot-M',
              color: AppConst.pink
            ),
          ),
        ),
      ),
    );
  }
}
