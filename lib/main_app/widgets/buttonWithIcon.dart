import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure.international.snackskitty.customer/main_app/utils/controller/sizeConfig.dart';

class PatButton extends StatelessWidget {

  final GetSizeConfig sizeConfig = Get.find();

  final IconData? icon;
  final String label;
  final Function onPressed;

  PatButton({
    this.icon,
    required this.label,
    required this.onPressed,
});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed as void Function()?,
      borderRadius: BorderRadius.circular(1111),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(sizeConfig.width * 120)),
        ),
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width * 20,
                  vertical: sizeConfig.height * 20),
              child: Container(
                alignment: Alignment.center,
                width: sizeConfig.width*1000,
                child: Text(
                  label,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            icon  == null ? SizedBox() : Container(
              margin: EdgeInsets.only(left: sizeConfig.width*10,top: sizeConfig.height*5),
              width: sizeConfig.width * 120,
              height: sizeConfig.width * 120,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
