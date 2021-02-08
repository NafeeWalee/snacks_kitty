import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pure.international.snackskitty.customer/main_app/resources/appConst.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitSquareCircle(color: AppConst.teal,);
  }
}
