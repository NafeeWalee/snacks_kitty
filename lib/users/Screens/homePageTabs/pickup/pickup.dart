import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pure_snackskitty/main_app/resources/appConst.dart';
import 'package:pure_snackskitty/main_app/utils/controller/sizeConfig.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pure_snackskitty/users/Screens/homePageTabs/pickup/pickupModel.dart';
import 'package:pure_snackskitty/users/Screens/modelClass.dart';

import '../../../../main_app/widgets/searchBar.dart';

class Pickup extends StatefulWidget {
  @override
  State<Pickup> createState() => _PickupState();
}

class _PickupState extends State<Pickup> {
  final GetSizeConfig getSizeConfig = Get.find();

  double? width = 0.0;

  double? height = 0.0;

  setInitialScreenSize() {
    width = getSizeConfig.width.value;
    height = getSizeConfig.height.value;
  }

  TextEditingController pickupSearchController = TextEditingController();

  FocusNode pickupSearchNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    setInitialScreenSize();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Searchbar(
              text: 'Find catto foodo nearo',
              searchController: pickupSearchController,
              searchNode: pickupSearchNode,
            ),
            Padding(
              padding: EdgeInsets.symmetric( horizontal: width! * 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width! * 10),
                        child: Text(
                          'Pick-Up and Save',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: getSizeConfig.getPixels(16)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height! * 15, horizontal: width! * 10),
                        child: Container(
                            width: width! * 550,
                            child: Text(
                              'Self-collect for guaranteed discount',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                            )),
                      )
                    ],
                  ),
                  Container(
                    width: width! * 380,
                    child: Image(
                      image: ExactAssetImage('assets/images/order_pick_up.png'),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width! * 25),
              child: Container(
                height: height! * 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width! * 30),
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: CachedNetworkImageProvider('https://i.ibb.co/0FjRDg0/thumbnail.jpg'),
                    )),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width! * 30),
                    color: Colors.yellow.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width! * 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width! * 30),
                          child: Text(
                            'We found restaurants near you',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: getSizeConfig.getPixels(12)),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width! * 40),
                          ),
                          elevation: 5,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: width! * 30, right: width! * 10, top: height! * 10, bottom: height! * 10),
                                child: Text(
                                  'Show map',
                                  style: TextStyle(color: AppConst.purple, fontWeight: FontWeight.normal, fontSize: getSizeConfig.getPixels(12)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: AppConst.purple,
                                  size: width! * 40,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width! * 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  nearestStores(),
                  allStore(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding nearestStores() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height! * 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width! * 15, vertical: height! * 5),
            child: Text(
              'Nearest to you',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: getSizeConfig.getPixels(18)),
            ),
          ),
          Container(
            height: height! * 350,
            child: ListView.builder(
              padding: EdgeInsets.only(right: width! * 30),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: nearestStore.length,
              itemBuilder: (context, index) {
                HomepageModelClass items = nearestStore[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height! * 250,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width! * 10, vertical: height! * 10),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppConst.purple.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(width! * 15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(items.imageURL!),
                                ),
                              ),
                              width: width! * 600,
                            ),
                            Card(
                                margin: EdgeInsets.only(top: width! * 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(width! * 20),
                                    bottomRight: Radius.circular(width! * 20),
                                  ),
                                ),
                                color: AppConst.purple,
                                child: Padding(
                                  padding: EdgeInsets.all(width! * 15),
                                  child: Text(
                                    '25% OFF',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                            Positioned(
                              top: height! * 180,
                              left: width! * 20,
                              child: Card(
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width! * 20)),
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(width! * 15),
                                  child: Text(
                                    'Pick up in 15 min',
                                    style: TextStyle(color: Colors.black),
                                  ),
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
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '(${items.review.toString()})',
                                      style: TextStyle(fontWeight: FontWeight.normal),
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
                              style: TextStyle(fontWeight: FontWeight.normal, fontSize: getSizeConfig.getPixels(14)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              '${items.distance.toString()} m away',
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
          padding: EdgeInsets.symmetric(horizontal: width! * 15, vertical: height! * 5),
          child: Text(
            'All Stores',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: getSizeConfig.getPixels(18)),
          ),
        ),
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: height! * 15),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: pickupStoreDetails.length,
            itemBuilder: (context, index) {
              HomepageModelClass items = pickupStoreDetails[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height! * 250,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width! * 10, vertical: height! * 10),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppConst.purple.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(width! * 15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(items.imageURL!),
                              ),
                            ),
                          ),
                          Card(
                              margin: EdgeInsets.only(top: width! * 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(width! * 20),
                                  bottomRight: Radius.circular(width! * 20),
                                ),
                              ),
                              color: AppConst.purple,
                              child: Padding(
                                padding: EdgeInsets.all(width! * 15),
                                child: Text(
                                  '25% OFF + Cookie Treats',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          Card(
                              margin: EdgeInsets.only(top: width! * 100),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(width! * 20),
                                  bottomRight: Radius.circular(width! * 20),
                                ),
                              ),
                              color: AppConst.purple,
                              child: Padding(
                                padding: EdgeInsets.all(width! * 15),
                                child: Text(
                                  'FEATURED',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          Positioned(
                            top: height! * 180,
                            left: width! * 20,
                            child: Card(
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width! * 20)),
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(width! * 15),
                                child: Text(
                                  'Pick up in 15 min',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
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
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '(${items.review.toString()})',
                                    style: TextStyle(fontWeight: FontWeight.normal),
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
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: getSizeConfig.getPixels(14)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            '${items.distance.toString()} m away',
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
        )
      ],
    );
  }
}
