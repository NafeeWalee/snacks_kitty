import 'package:flutter/material.dart';

class UnderLinedText extends StatelessWidget {
  final String text;
  final TextStyle size;
  final Color color;
  final double padding;
  UnderLinedText({
    this.padding = 0.0,
    this.color = Colors.black,
    required this.text,
    required this.size
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 3, // space between underline and text
      ),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
            color: color,  // Text colour here
            width: 2.0, // Underline width
          ))
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Text(
          text,
          style: size,
        ),
      ),
    );
  }
}