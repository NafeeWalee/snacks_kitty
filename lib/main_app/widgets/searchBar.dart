import 'package:flutter/material.dart';

import '../resources/appConst.dart';
import '../utils/controller/sizeConfig.dart';
import 'package:get/get.dart';

class Searchbar extends StatefulWidget {
  final String text;
  final TextEditingController searchController;
  final FocusNode searchNode;
  Searchbar({super.key, required this.searchController, required this.searchNode, required this.text});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final GetSizeConfig getSizeConfig = Get.find();

  double? width = 0.0;

  double? height = 0.0;

  setInitialScreenSize() {
    width = getSizeConfig.width.value;
    height = getSizeConfig.height.value;
  }

  @override
  Widget build(BuildContext context) {
    setInitialScreenSize();
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width! * 20, vertical: height! * 10),
          child: Card(
            elevation: 6,
            child: Container(
              width: width! * 800,
              height: height! * 40,
              child: TextField(
                controller: widget.searchController,
                focusNode: widget.searchNode,
                onSubmitted: (search) {},
                style: TextStyle(decoration: TextDecoration.none, fontSize: getSizeConfig.getPixels(16), color: Colors.black),
                textInputAction: TextInputAction.search,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: widget.text,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppConst.purple,
                  ),
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(width! * 20)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width! * 5),
          child: Card(
            elevation: 6,
            child: Container(
              width: width! * 80,
              height: width! * 80,
              child: Icon(
                Icons.add_road_outlined,
                color: AppConst.purple,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
