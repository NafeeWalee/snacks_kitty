import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure_live_chat/main_app/utils/controller/sizeConfig.dart';

class IconButtonConstraints extends StatelessWidget {
  final Function function;
  final IconData icon;
  final Color color;
  final double size;
  IconButtonConstraints({@required this.function, @required this.icon,@required this.color,@required this.size});
  final GetSizeConfig sizeConfigController = Get.find();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: size,
      color: color,
      iconSize: size,
      onPressed: () {
        if(function != null)
          function();
        },
      icon: Icon(icon),
      constraints: BoxConstraints(),
      padding: EdgeInsets.zero,
    );
  }
}
