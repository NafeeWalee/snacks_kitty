import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure_live_chat/main_app/resources/appConst.dart';
import 'package:pure_live_chat/main_app/utils/controller/sizeConfig.dart';

class BasicHeaderWidget extends StatelessWidget {
  final GetSizeConfig sizeConfig = Get.find();
  final String title;
  final String subtitle;
  BasicHeaderWidget({
    @required this.title,
    @required this.subtitle,
});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: double.infinity,height: AppBar().preferredSize.height,),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: sizeConfig.getPixels(28),
              fontWeight: FontWeight.bold,
              color: AppConst.pink
          ),
        ),
        SizedBox(height: sizeConfig.height * 10,),
        Text(
          subtitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: sizeConfig.getPixels(18),
              color: AppConst.pink
          ),
        ),
        SizedBox(height: sizeConfig.height * 40,),
      ],
    );
  }
}
