
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'file:///C:/Users/nafee/AndroidStudioProjects/PureLiveChat-Personal-/lib/main_app/resources/appConst.dart';

class LeadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: AppConst.black,
      ),
      onPressed: ()=> Get.back()
    );
  }
}
