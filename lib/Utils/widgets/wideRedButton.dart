
import 'package:pure_live_chat/Utils/controller/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure_live_chat/appConst.dart';


class WideRedButton extends StatelessWidget {
  final GetSizeConfig sizeConfig = Get.find();
  final String label;
  final Color color;
  final Function onPressed;
  WideRedButton({
    @required this.label,
    @required this.onPressed,
    this.color
});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      height: sizeConfig.getPixels(45),
      minWidth: double.infinity,
      color: color ?? AppConst.pink,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sizeConfig.width* 15)
      ),
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
    );
  }
}
