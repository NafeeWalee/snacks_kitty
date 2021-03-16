import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pure_snackskitty/main_app/resources/appConst.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(color: AppConst.purple,);
  }
}
