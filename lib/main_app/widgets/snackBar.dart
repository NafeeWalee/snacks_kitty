import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snack{
  static bottom(title,message){
    Get.rawSnackbar(
      title: title,
      message: message
    );
  }

  static top(title,message){
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
    );
  }
}