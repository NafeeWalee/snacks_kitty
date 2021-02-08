
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure.international.snackskitty.customer/main_app/resources/appConst.dart';
import 'package:pure.international.snackskitty.customer/main_app/utils/controller/sizeConfig.dart';

class SearchTextField extends StatelessWidget {
  final GetSizeConfig sizeConfig = Get.find();

  final TextEditingController controller;
  final String hintText;
  final Function onSubmitted;
  SearchTextField({
    @required this.controller,
    @required this.onSubmitted,
    @required this.hintText
});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onEditingComplete: onSubmitted,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppConst.greyLight,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(sizeConfig.width*20)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: sizeConfig.width*25),
        suffixIcon: Icon(
          CupertinoIcons.search,
          color: Colors.grey,
        )
      ),
    );
  }
}
