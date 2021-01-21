import 'package:flutter/material.dart';

class NoPaddingCheckbox extends StatelessWidget {
  final bool isMarked;
  final Function(bool newValue) onChange;
  final double size;
  final Color color;

  NoPaddingCheckbox({
    @required this.isMarked,
    @required this.onChange,
    this.size = 24,
    this.color = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size, maxWidth: size),
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Icon(_getIconData(), size: size,color: color,),
        onPressed: () => onChange(!isMarked),
      ),
    );
  }

  IconData _getIconData() {
    if (isMarked) {
      return Icons.check_box;
    }

    return Icons.check_box_outline_blank;
  }
}