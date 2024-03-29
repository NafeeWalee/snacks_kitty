import 'package:flutter/material.dart';

class OverScroll extends StatelessWidget {
  final Widget child;
  OverScroll({required this.child,});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overScroll) {
          overScroll.disallowIndicator();
          return null;
        } as bool Function(OverscrollIndicatorNotification)?,
        child: child);
  }
}