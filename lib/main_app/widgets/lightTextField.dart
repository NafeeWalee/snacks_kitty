
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure_live_chat/main_app/utils/controller/sizeConfig.dart';

class LightTextField extends StatelessWidget {
  final GetSizeConfig sizeConfig = Get.find();
  final String hintText;
  final bool enabled;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool suffix;
  final bool obscure;
  final inputFormatter;
  final Color hintColor;
  final int minLines;
  final int maxLines;
  LightTextField({
    @required this.hintText,
    this.enabled = false,
    this.suffix = false,
    this.obscure = false,
    this.inputFormatter,
    this.minLines = 1,
    this.maxLines = 10,
    this.textInputType = TextInputType.text,
    this.hintColor,
    @required this.controller
});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          keyboardType: textInputType,
          inputFormatters: inputFormatter,
          controller: controller,
          enabled: enabled,
          minLines: minLines,
          obscureText: obscure,
          maxLines: obscure ? 1 :  maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintColor ?? Color(0xffD2D2D2)
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD2D2D2),
              ),
              borderRadius: BorderRadius.circular(sizeConfig.width * 20),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD2D2D2),
              ),
              borderRadius: BorderRadius.circular(sizeConfig.width * 20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD2D2D2),
              ),
              borderRadius: BorderRadius.circular(sizeConfig.width * 20),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD2D2D2),
              ),
              borderRadius: BorderRadius.circular(sizeConfig.width * 20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD2D2D2),
              ),
              borderRadius: BorderRadius.circular(sizeConfig.width * 20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD2D2D2),
              ),
              borderRadius: BorderRadius.circular(sizeConfig.width * 20),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: sizeConfig.width * 25,vertical: sizeConfig.height * 10)
          ),
        ),
        suffix ? Positioned(
          right: sizeConfig.width * 10,
          child: IconButton(
            onPressed: ()=>controller.clear(),
            icon: Icon(
              Icons.cancel,
              color: Color(0xffD2D2D2),
            ),
          ),
        ) : SizedBox()
      ],
    );
  }
}
