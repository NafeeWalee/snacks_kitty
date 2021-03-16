
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConst{


  static final Color blue = Color(0xff2699FB);
  static final Color green = Color(0xff2ECC71);
  static final Color greenLight = Color(0xffE1F8EA);
  static final Color white = Color(0xfff7f8f9);
  static final Color black = Color(0xff333333);
  static final Color? grey = Colors.grey[600];
  static final Color? greyLight = Colors.grey[300];
  static const Color pink = Color(0xffe54577);
  static const Color teal = Color(0xff3ad7d9);
  static const Color purple = Colors.purple;

  static final Color textTitleColor = Color(0xff14213d);
  static final Color? textBodyColor = Colors.grey[500];
  static final Color? textLightColor = Colors.grey[300];


  static final Duration duration = Duration(milliseconds: 300);
  static final BoxShadow shadow = BoxShadow(
      color: Colors.grey,
      spreadRadius: 5,
      blurRadius: 15
  );

/*  static final Widget couponIcon = SvgPicture.asset(
    'assets/images/svg/coupon.svg',
    color: pink
  );*/
}
