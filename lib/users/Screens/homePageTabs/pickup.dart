import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pure.international.snackskitty.customer/main_app/utils/controller/sizeConfig.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pure.international.snackskitty.customer/users/Screens/homePageTabs/deliveryModel/deliveryModel.dart';

class Pickup extends StatelessWidget {
  final GetSizeConfig getSizeConfig = Get.find();
  double width;
  double height;

  setInitialScreenSize() {
    width = getSizeConfig.width.value;
    height = getSizeConfig.height.value;
  }

  TextEditingController search = TextEditingController();
  FocusNode searchNode = FocusNode();

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
              padding: EdgeInsets.only(left: width * 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  newProducts(),
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
              horizontal: width * 20, vertical: height * 10),
          child: Card(
            elevation: 6,
            child: Container(
              width: width * 750,
              height: width * 150,
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
                    hintText: 'Find catto foodo',
                    prefixIcon: Icon(Icons.search,color: Colors.purple,),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(width * 20)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(width * 20)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(width * 20)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(width * 20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(width * 20)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(width * 20))),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 5),
          child: Card(
            elevation: 6,
            child: Container(
              width: width * 150,
              height: width * 150,
              child: Icon(Icons.add_road_outlined,color: Colors.purple,),
            ),
          ),
        ),
      ],
    );
  }

  Padding newProducts() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 15,vertical: height*5),
            child: Text(
              'New On SnacksKitty',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: getSizeConfig.getPixels(18)),
            ),
          ),
          Container(
            height: height * 350,
            child: ListView.builder(
              padding: EdgeInsets.only(right: width*30),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: newItems.length,
              itemBuilder: (context, index) {
                var items = newItems[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 250,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 10, vertical: height * 10),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(width * 15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      items.imageURL),
                                ),
                              ),
                              width: width * 600,
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: height * 10),
                              width: width * 250,
                              height: height * 35,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(width * 20),
                                    bottomRight: Radius.circular(width * 20)),
                              ),
                              child: Text(
                                '25% OFF',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  top: height * 180, left: width * 20),
                              width: width * 160,
                              height: height * 35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(width * 20),
                              ),
                              child: Text(
                                '20 min',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: width * 600,
                      padding: EdgeInsets.symmetric(horizontal: width * 10),
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
                                  items.storeName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: width * 45,
                                      color: Colors.purple,
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
                              items.storeAddress,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: getSizeConfig.getPixels(14)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'Tk ${items.deliveryFee.toString()} Delivery fee',
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
          padding: EdgeInsets.symmetric(horizontal: width * 15,vertical: height*5),
          child: Text(
            'All Stores',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: getSizeConfig.getPixels(18)),
          ),
        ),
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: height*15),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: storeDetails.length,
            itemBuilder: (context, index) {
              var items = storeDetails[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 250,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 10, vertical: height * 10),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(width * 15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                    items.imageURL),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: height * 10),
                            width: width * 500,
                            height: height * 35,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(width * 20),
                                  bottomRight: Radius.circular(width * 20)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left:width*25),
                              child: Text(
                                '25% OFF + Cookie Treats',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: height * 50),
                            width: width * 250,
                            height: height * 35,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(width * 20),
                                  bottomRight: Radius.circular(width * 20)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left:width*25),
                              child: Text(
                                'FEATURED',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: height * 180, left: width * 20),
                            width: width * 160,
                            height: height * 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(width * 20),
                            ),
                            child: Text(
                              '20 min',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 10),
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
                                items.storeName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: width * 45,
                                    color: Colors.purple,
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
                            items.storeAddress,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: getSizeConfig.getPixels(14)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            'Tk ${items.deliveryFee.toString()} Delivery fee',
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
