import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutDialog{

  final String title;
  final String logoutText;
  final String cancelText;

  final double width;
  final double height;

  final Color positiveColor;
  final Color negativeColor;

  final Function onPositivePress;
  final Function onNegativePress;

  LogoutDialog({this.title, this.logoutText, this.cancelText, @required this.height, @required this.width, this.negativeColor, this.positiveColor, this.onNegativePress, @required this.onPositivePress});


  void showCustomDialog(BuildContext context){
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => Dialog(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: width*30,vertical: height*30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    title ?? 'Are you sure you want to\nLogout?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: width * 45,
                        fontWeight: FontWeight.normal,
                        color: Colors.black)
                ),
                SizedBox(
                  height: height * 40,
                ),
                FlatButton(
                  onPressed: () {
                    onPositivePress();
                  },
                  color: positiveColor??Colors.red,
                  child: Container(
                    height: height * 65,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                          logoutText??'Logout',
                          style: TextStyle(
                              fontSize: width * 45,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 20,
                ),
                FlatButton(
                  onPressed: () {
                    onNegativePress ?? Get.back();
                  },
                  color: negativeColor??Colors.black,
                  child: Container(
                    height: height * 65,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                          cancelText??'Cancel',
                          style: TextStyle(
                              fontSize: width * 45,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }


}