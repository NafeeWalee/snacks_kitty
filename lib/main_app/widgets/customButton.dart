import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure_live_chat/main_app/utils/controller/sizeConfig.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final Function function;
  final IconData icon;
  final IconData iconTrailing;
  final Color color;
  final double width;
  final double height;
  final double textSize;
  final double radius;
  CustomButton({this.iconTrailing,@required this.title, @required this.function, this.icon, this.color,this.width,this.height,this.textSize,this.radius});

  final GetSizeConfig sizeConfigController = Get.find();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: function,
      color: color?? Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius??sizeConfigController.width*20)),
      child: Container(
        height: height??sizeConfigController.height * 70,
        width: width??sizeConfigController.width * 1000,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null ? Icon(
                    icon,
                    size: sizeConfigController.height * 35,
                    color: Colors.black,
                  ): Text(''),
                  icon != null ? SizedBox(width: sizeConfigController.width * 25,) : Text(''),
                  Text(
                    title,
                    style: TextStyle(fontSize: textSize??sizeConfigController.getPixels(20),color: Colors.black),
                  ),
                ],
              ),
            ),
            iconTrailing != null?Expanded(
              flex: 1,
              child: Icon(
                iconTrailing,
                size: sizeConfigController.height * 35,
                color: Colors.black,
              ),
            ):Container()
          ],
        ),
      ),
    );
  }
}
