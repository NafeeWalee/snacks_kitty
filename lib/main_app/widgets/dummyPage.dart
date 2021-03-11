
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/controller/sizeConfig.dart';

class DummyPage extends StatefulWidget {
  @override
  _DummyPageState createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  double? height;

  double? width;


  GetSizeConfig getSizeConfig = Get.find();

  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    } else {
      setInitialScreenSize();
    }
  }

  setInitialScreenSize() {
    width = getSizeConfig.width.value;
    height = getSizeConfig.height.value;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Text('Empty'),
      ),
    );
  }

}