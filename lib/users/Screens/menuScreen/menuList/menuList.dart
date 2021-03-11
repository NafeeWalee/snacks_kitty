import 'package:flutter/material.dart';
import 'package:pure.international.snackskitty.customer/main_app/utils/controller/sizeConfig.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pure.international.snackskitty.customer/main_app/widgets/iconButton.dart';
import 'package:pure.international.snackskitty.customer/users/Screens/modelClass.dart';

class MenuScreen extends StatefulWidget {
  final HomepageModelClass items;

  MenuScreen({required this.items});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  ScrollController _scrollController = ScrollController();

  final GetSizeConfig getSizeConfig = Get.find();
  double? width;
  double? height;

  final maxExtent = 200.0;
  double currentExtent = 0.0;

  bool showTitle = false;

  List<Text> tabBars = [];
  List<ProductCategory> categoryData = [];
  List<ProductList> productData = [];
  List<int> breakPoint = [];


  setInitialScreenSize() {
    width = getSizeConfig.width.value;
    height = getSizeConfig.height.value;
  }

  int selectedIndex = 0;
  int categories = 0;
  int products = 0;

  int lineBreaker = 0;

  @override
  void initState() {
    if (!mounted) {
      return;
    } else {
      super.initState();
      setInitialScreenSize();
      scrollListener();

      getData();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  scrollListener() {
    _scrollController.addListener(() {
      currentExtent = maxExtent - _scrollController.offset;
      if (currentExtent < 0) currentExtent = 0.0;
      if (currentExtent > maxExtent) currentExtent = maxExtent;
      // print(currentExtent);
      // print( _scrollController.offset);
      if (currentExtent <= 60 && !showTitle) {
        showTitle = !showTitle;
        setState(() {
          print(showTitle);
        });
      }
      if (currentExtent >= 61 && showTitle) {
        showTitle = !showTitle;
        setState(() {
          print(showTitle);
        });
      }
    });
  }

  getData() {
    categoryData.addAll(widget.items.productCategoryList!);

    for (categories = 0; categories < categoryData.length; categories++) {
      for (products = 0; products < categories; products++){
        productData.addAll(categoryData[categories].productList!);
      }

      if(breakPoint.isEmpty){
        breakPoint.add(products);
        print('empty add+ $breakPoint');
      }else{
        breakPoint.add(breakPoint[breakPoint.length -1 ] + products);
        print('++ $breakPoint');
      }
    }
    print('category length: ${categoryData.length}');
    print('category length: ${productData.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width! * 500),
                          color: Colors.white),
                      child: IconButtonConstraints(
                        size: width! * 90,
                        color: Colors.purple,
                        icon: Icons.arrow_back,
                        function: () {
                          Get.back();
                        },
                        iconSize: width! * 70,
                      )),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width! * 500),
                              color: Colors.white),
                          child: IconButtonConstraints(
                            size: width! * 90,
                            color: Colors.purple,
                            icon: Icons.share_outlined,
                            function: () {},
                            iconSize: width! * 70,
                          )),
                      SizedBox(
                        width: width! * 30,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width! * 500),
                              color: Colors.white),
                          child: IconButtonConstraints(
                            size: width! * 90,
                            color: Colors.purple,
                            icon: Icons.info_outline,
                            function: () {},
                            iconSize: width! * 70,
                          )),
                    ],
                  )
                ],
              ),
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: maxExtent,
              backgroundColor: Colors.purple,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  widget.items.storeName!,
                  style: TextStyle(
                      color: showTitle ? Colors.white : Colors.transparent),
                ),
                background: Stack(
                  children: [
                    Center(
                      child: Hero(
                        tag: widget.items.imageURL!,
                        child: CachedNetworkImage(
                          imageUrl: widget.items.imageURL!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                    ),
                    Positioned(
                      top: height! * 170,
                      left: width! * 100,
                      child: Container(
                        width: width! * 800,
                        height: height! * 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.items.storeName!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: getSizeConfig.getPixels(32),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height! * 20,
                            ),
                            Card(
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 2.0),
                                  borderRadius:
                                      BorderRadius.circular(width! * 40)),
                              color: Colors.black.withOpacity(0.3),
                              child: Padding(
                                padding: EdgeInsets.all(width! * 25),
                                child: Text(
                                  'Delivery: 20 min',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height! * 10,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: width! * 45,
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.items.rate.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  '(${widget.items.review.toString()})',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                  maxH: height! * 80,
                  minH: height! * 80,
                  container: Container(
                    height: height! * 80,
                    width: height! * 80,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: height! * 80,
                      ),
                      child: ListView.builder(
                          itemCount: categoryData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero,),
                              onPressed: () {
                                setState(() {
                                  selectedIndex = index;
                                  print(selectedIndex);
                                  print(index);
                                });
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: selectedIndex == index
                                            ? Colors.purple
                                            : Colors.transparent),
                                  )),
                                  height: height! * 80,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: width! * 220,
                                    ),
                                    child: Text(
                                      categoryData[index].categoryName!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: selectedIndex == index
                                              ? Colors.purple
                                              : Colors.black,
                                          fontSize: getSizeConfig.getPixels(16),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            );
                          }),
                    ),
                  )),
              pinned: true,
              floating: false,
            )
          ];
        },
        body: Container(
          color: Colors.grey,
          child: ListView.builder(
              itemCount: productData.length,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                print(index);
                ProductList items = productData[index];

                if(index != 0){
                  breakPoint.forEach((element) {
                    if(element == index){
                      lineBreaker++;

                    }
                  });
                }

                //print(lineBreaker);

                return Padding(
                  padding: EdgeInsets.only(bottom: height! * 20),
                  child: Container(
                    width: width! * 1000,
                    height: height! * 200,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height! * 20, horizontal: width! * 35),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            categoryData[0].categoryName!,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: getSizeConfig.getPixels(30)),
                          ),
                          SizedBox(
                            height: height! * 10,
                          ),
                          Text(
                            items.itemName!,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: getSizeConfig.getPixels(16)),
                          ),
                          Text(
                            items.details!,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: getSizeConfig.getPixels(14)),
                          ),
                          SizedBox(
                            height: height! * 10,
                          ),
                          Text(
                            'Tk ${items.price.toString()}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: getSizeConfig.getPixels(16)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar? tabBar;
  final Container? container;
  final double? minH;
  final double? maxH;

  _SliverAppBarDelegate({this.tabBar, this.container, this.maxH, this.minH});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: container,
    );
  }

/*  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;*/

  @override
  double get maxExtent => maxH!;

  @override
  double get minExtent => minH!;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
