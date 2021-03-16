import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pure_snackskitty/main_app/resources/appConst.dart';
import 'package:pure_snackskitty/main_app/utils/controller/sizeConfig.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pure_snackskitty/users/Screens/modelClass.dart';

import 'shopsModel.dart';

class Shops extends StatelessWidget {
  final GetSizeConfig getSizeConfig = Get.find();
  double? width = 0.0;
  double? height = 0.0;

  setInitialScreenSize() {
    width = getSizeConfig.width.value;
    height = getSizeConfig.height.value;
  }

  final TextEditingController search = TextEditingController();
  final FocusNode searchNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    setInitialScreenSize();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchFilter(),
            Padding(
              padding: EdgeInsets.only(left: width! * 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  promo(),
                 // shopFromKittyMart(),
                  oneStopShop(),
                  allStore(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row searchFilter() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width! * 20, vertical: height! * 10),
          child: Card(
            elevation: 6,
            child: Container(
              width: width! * 750,
              height: width! * 150,
              child: TextField(
                controller: search,
                focusNode: searchNode,
                onSubmitted: (search) {},
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: getSizeConfig.getPixels(16),
                    color: Colors.black),
                textInputAction: TextInputAction.search,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: 'Find catto shopo',
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppConst.purple,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(width! * 20)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(width! * 20)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(width! * 20)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(width! * 20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(width! * 20)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(width! * 20))),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width! * 5),
          child: Card(
            elevation: 6,
            child: Container(
              width: width! * 150,
              height: width! * 150,
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

  Container promo() {
    return Container(
      margin: EdgeInsets.only(bottom: height! * 10),
      height: height! * 270,
      child: ListView.builder(
          padding: EdgeInsets.only(right: width! * 30),
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: promoClass.length,
          itemBuilder: (context, index) {
            PromoClass items = promoClass[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width! * 10, vertical: height! * 15),
              child: Container(
                decoration: BoxDecoration(
                  color: AppConst.purple.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(width! * 15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        CachedNetworkImageProvider(items.imageURL!),
                  ),
                ),
                width: width! * 350,
              ),
            );
          }),
    );
  }

  Padding shopFromKittyMart() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height! * 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width! * 15, vertical: height! * 5),
            child: Text(
              'Shop from SnacksKitty',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getSizeConfig.getPixels(18)),
            ),
          ),
          Container(
            height: height! * 180,
            child: ListView.builder(
              padding: EdgeInsets.only(right: width! * 30),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: shopsFromSnacksKitty.length,
              itemBuilder: (context, index) {
                PromoClass items = shopsFromSnacksKitty[index];
                return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height! * 10, horizontal: width! * 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width! * 40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(width! * 40),
                        child: Container(
                          width: height! * 180,
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: height! * 40),
                                height: height! * 200,
                                alignment: Alignment.bottomCenter,
                                child: Image.network(
                                  items.imageURL!,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width! * 15,
                                    vertical: height! * 15),
                                child: Container(
                                  color: Colors.white,
                                  width: height! * 180,
                                  child: Text(
                                    items.title!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: getSizeConfig.getPixels(12)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    /*Container(
                    width: height * 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 40),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect( borderRadius: BorderRadius.circular(width * 40),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 15, vertical: height * 15),
                            child: Text(
                              items.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getSizeConfig.getPixels(12)),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(width * 80),
                                bottomLeft: Radius.circular(width * 80)),
                            child: Container(
                              height: height * 100,
                              alignment: Alignment.center,
                              child: Image.network(
                                'https://www.simplyrecipes.com/wp-content/uploads/2014/07/hard-boiled-eggs-horiz-800.jpg',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),*/
                    );
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding oneStopShop() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height! * 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width! * 15, vertical: height! * 5),
            child: Text(
              'One Stop Shop',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getSizeConfig.getPixels(18)),
            ),
          ),
          Container(
            height: height! * 350,
            child: ListView.builder(
              padding: EdgeInsets.only(right: width! * 30),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: oneStopShopList.length,
              itemBuilder: (context, index) {
                HomepageModelClass items = oneStopShopList[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height! * 250,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width! * 10, vertical: height! * 10),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppConst.purple.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(width! * 15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      items.imageURL!),
                                ),
                              ),
                              width: width! * 600,
                            ),
                            Card(
                                margin: EdgeInsets.only(top: width!*20),
                                shape: RoundedRectangleBorder( borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(width! * 20),
                                  bottomRight: Radius.circular(width! * 20),
                                ),
                                ),
                                color: AppConst.purple,
                                child: Padding(
                                  padding: EdgeInsets.all( width! * 15),
                                  child: Text(
                                    'KITTY20 or KITTY50',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                            Card(
                                margin: EdgeInsets.only(top: width!*100),
                                shape: RoundedRectangleBorder( borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(width! * 20),
                                    bottomRight: Radius.circular(width! * 20),
                                ),
                                ),
                                color: AppConst.purple,
                                child: Padding(
                                  padding: EdgeInsets.all( width! * 15),
                                  child: Text(
                                    items.deliveryFee == 0
                                        ? 'Free delivery'
                                        : 'Tk ${items.deliveryFee.toString()} Delivery fee',
                                    style: TextStyle(color: Colors.white),),
                                )),
                            Positioned(
                              top: height! * 180,
                              left: width! *25,
                              child: Card(
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width!*20)),
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all( width! * 15),
                                  child: Text( '20 min',
                                    style: TextStyle(color: Colors.black),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: width! * 600,
                      padding: EdgeInsets.symmetric(horizontal: width! * 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  items.storeName!,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: width! * 45,
                                      color: AppConst.purple,
                                    ),
                                    Text(
                                      items.rate.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '(${items.review.toString()})',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              '${items.expense!} ${items.storeAddress!}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: getSizeConfig.getPixels(14)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              items.deliveryFee == 0
                                  ? 'Free delivery'
                                  : 'Tk ${items.deliveryFee.toString()} Delivery fee',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  allStore() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width! * 15, vertical: height! * 5),
          child: Text(
            'Shop by Stores',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getSizeConfig.getPixels(18)),
          ),
        ),
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: height! * 15),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: shopList.length,
            itemBuilder: (context, index) {
              HomepageModelClass items = shopList[index];
              return Padding(
                padding: EdgeInsets.only(
                    right: width! * 20, top: height! * 10, bottom: height! * 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width! * 30),
                  ),
                  elevation: 5,
                  color: Colors.white,
                  child: Container(
                    height: height! * 270,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(width! * 35),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(width! * 40),
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: CachedNetworkImageProvider(
                                                    items.imageURL!),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: width!*10,
                                            left: width!*130,
                                            child: Card(
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width!*20)),
                                                color: Colors.white,
                                                child: Padding(
                                                  padding: EdgeInsets.all( width! * 10),
                                                  child: Text( '20 min',
                                                    style: TextStyle(color: Colors.black),),
                                                ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: height! * 20),
                                      child: Text(
                                       items.deliveryFee == 0? 'Free delivery' : items.deliveryFee as String,
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize:
                                                getSizeConfig.getPixels(12)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: width! * 35,
                                bottom: width! * 35,
                                right: width! * 35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height! * 5,horizontal: width!*15),
                                  child: Text(
                                    items.storeName!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getSizeConfig.getPixels(16)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height! * 5,horizontal: width!*15),
                                  child: Text(
                                    '${items.expense!} ${items.storeAddress!}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize:
                                            getSizeConfig.getPixels(16)),
                                  ),
                                ),
                                SizedBox(
                                  height: height! * 15,
                                ),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width!*30)),
                                      color: AppConst.purple,
                                      child: Padding(
                                        padding: EdgeInsets.all( width! * 15),
                                        child: Text(
                                          items.promoName!,
                                          style: TextStyle(color: Colors.white),),
                                      )),
                                ),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width!*30)),
                                      color: AppConst.purple,
                                      child: Padding(
                                        padding: EdgeInsets.all( width! * 15),
                                        child: Text(
                                          items.deliveryFee == 0
                                              ? 'Free delivery'
                                              : 'Tk ${items.deliveryFee.toString()} Delivery fee',
                                          style: TextStyle(color: Colors.white),),
                                      )),
                                ),

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
