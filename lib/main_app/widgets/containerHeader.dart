import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pure.international.snackskitty.customer/main_app/widgets/iconButton.dart';


class ContainerHeader extends StatelessWidget {
  final double height,width;
  final Function? function;
  final String title;
  final bool? shadow;
  final String? subTitle;
  final List<Widget>? widget;
  final Color? color;
  ContainerHeader({this.function,this.widget,this.subTitle,required this.title,this.color,this.shadow,required this.width,required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadow != null?Colors.grey.withOpacity(0.4):Colors.transparent,
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: subTitle == null? height*80: height*120,
      width: width * 1000,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            function != null ? Padding(
              padding: EdgeInsets.only(right:width*20),
              child:
              IconButtonConstraints(
                icon: Icons.arrow_back,
                function: () {function!();},
                size: width*60,
                color: Colors.black,
                iconSize: width*60,
              ),
            ) : SizedBox(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: width*50
                  ),
                ),
                SizedBox(
                  height: height*7,
                ),
                subTitle == null ? SizedBox() : Text(
                  subTitle!,
                  style: TextStyle(
                      fontSize: width*14,
                      color: Colors.black.withOpacity(.7)
                  )
                ),
              ],
            ),
            widget != null ? Spacer() : SizedBox(),
            widget != null ? Row(children: widget!) : SizedBox(),
          ],
        ),
      ),
    );
  }
}