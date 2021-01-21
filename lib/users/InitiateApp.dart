import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure_live_chat/main_app/utils/controller/sizeConfig.dart';
import 'package:pure_live_chat/users/Screens/homePage.dart';
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
          fontFamily: 'PermanentMarker-Regular',
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.deepPurple,
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