import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure_snackskitty/main_app/utils/controller/sizeConfig.dart';

class IconButtonConstraints extends StatelessWidget {
  final Function function;
  final IconData icon;
  final Color color;
  final double size;
  final double iconSize;

  IconButtonConstraints(
      {required this.function,
      required this.icon,
      required this.color,
      required this.size,
      required this.iconSize});

  final GetSizeConfig sizeConfigController = Get.find();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: size,
      color: color,
      iconSize: size,
      onPressed: () {
        function();
      },
      icon: Icon(icon,size: iconSize,),
      constraints: BoxConstraints(),
      padding: EdgeInsets.zero,
    );
  }
}
