import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure.international.snackskitty.customer/main_app/utils/controller/sizeConfig.dart';
import 'package:pure.international.snackskitty.customer/users/Screens/homePage.dart';
class InitiateApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Get.put(GetSizeConfig());

    return GetMaterialApp(
      title: 'Pure International',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.zoom,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Grandstander',
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.white,
            // color: Colors.deepPurple,
            centerTitle: false,
            iconTheme: IconThemeData(
                color: Colors.black
            ),

          )
      ),
      home: HomePage(),
    );
  }
}