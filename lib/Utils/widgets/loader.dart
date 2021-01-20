import 'package:flutter/material.dart';
import 'package:pure_live_chat/appConst.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitSquareCircle(color: AppConst.teal,);
  }
}
