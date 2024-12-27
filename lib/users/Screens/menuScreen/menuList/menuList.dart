import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pure_snackskitty/main_app/resources/appConst.dart';
import 'package:pure_snackskitty/main_app/widgets/customScrollListView/scrollable_list_tabview.dart';
import 'package:pure_snackskitty/main_app/widgets/loader.dart';
import 'package:pure_snackskitty/main_app/widgets/snackBar.dart';
import 'package:pure_snackskitty/users/Screens/modelClass.dart';
import 'package:pure_snackskitty/main_app/utils/controller/sizeConfig.dart';

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

  bool safeArea = false;
  bool foodsLoading = true;

  List<Text> tabBars = [];
  List<ProductCategory> categoryData = [];
  List<ProductList> productData = [];
  List<int> breakPoint = [];

  setInitialScreenSize() {
    width = getSizeConfig.width.value;
    height = getSizeConfig.height.value;
  }

  int categories = 0;
  int products = 0;

  @override
  void initState() {
    if (!mounted) {
      return;
    } else {
      super.initState();
      setInitialScreenSize();
      getData();
      scrollListener();
      Future.delayed(Duration(milliseconds: 1000), () {
        setState(() {
          foodsLoading = false;
        });
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  scrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.offset > Get.height * .4) {
        if (!safeArea) {
          setState(() {
            safeArea = true;
          });
        }
      } else {
        if (safeArea) {
          setState(() {
            safeArea = false;
          });
        }
      }
    });
  }

  getData() {
    categoryData.addAll(widget.items.productCategoryList!);
    for (categories = 0; categories < categoryData.length; categories++) {
      for (products = 0; products < categories; products++){
        productData.addAll(categoryData[categories].productList!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: safeArea ? AppConst.purple : Colors.transparent,
        elevation: 0,
        title: AnimatedCrossFade(
          firstChild: Text(widget.items.storeName!.trim().capitalize!),
          secondChild: SizedBox(),
          duration: Duration(milliseconds: 200),
          crossFadeState:
              safeArea ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
          controller: _scrollController,
          physics: ScrollPhysics(parent: PageScrollPhysics()),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([_buildRestaurantInfo()]),
              ),
            ];
          },
          body: SafeArea(
            top: safeArea,
            child: foodsLoading ? Loader() : _buildRestaurantFoods(),
          ),
      ),
    );
  }

  _buildRestaurantInfo() {
    return Container(
      height: Get.height * .5,
      child: Column(
        children: [
          Expanded(
            flex: 81,
            child: Stack(
              children: [
                Hero(
                  tag: '${widget.items.imageURL!}',
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(widget.items.imageURL!),
                            fit: BoxFit.cover)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black,Colors.black.withOpacity(0.1)]
                    )
                  ),
                ),
                Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    color: Color(0xff152238).withOpacity(.3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.items.storeName!.trim().capitalize!,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  CupertinoIcons.location_solid,
                                  color: Colors.grey[200],
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    widget.items.storeAddress!,
                                    style: TextStyle(color: Colors.grey[200]),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: .7,
                        color: Colors.white38,
                      ),
                      Container(
                        height: Get.height * .07,
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: double.infinity,
                              width: Get.width * .33,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          CupertinoIcons.money_dollar,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Price',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18,
                                              height: 1.4),
                                        )
                                      ],
                                    ),
                                    Text(
                                      ' ${widget.items.expense} expense',
                                      style: TextStyle(color: Colors.grey[200]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: .7,
                              height: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 5),
                              color: Colors.white38,
                            ),
                            Container(
                              height: double.infinity,
                              width: Get.width * .33,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.restaurant,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Foods',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18,
                                              height: 1.4),
                                        )
                                      ],
                                    ),
                                    Text(
                                      ' ${productData.length} Items',
                                      style: TextStyle(color: Colors.grey[200]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: .7,
                              height: double.infinity,
                              color: Colors.white38,
                              margin: EdgeInsets.symmetric(vertical: 5),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (widget.items.review! == 0) {
                                  Snack.top('Sorry!',
                                      'This restaurant has to reviews yet');
                                } else {}
                              },
                              child: Container(
                                height: double.infinity,
                                width: Get.width * .33,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            CupertinoIcons.star_fill,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${widget.items.rate!.toStringAsFixed(1)}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 18,
                                                height: 1.4),
                                          )
                                        ],
                                      ),
                                      Text(
                                        ' ${widget.items.review!} Ratings',
                                        style:
                                            TextStyle(color: Colors.grey[200]),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: AppConst.purple,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'About: ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: widget.items.about!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
            ,
          ),
        ],
      ),
    );
  }

  _buildRestaurantFoods() {
    return GestureDetector(
      onVerticalDragDown: (details) {
        if (details.localPosition.dx > details.localPosition.dy) {
          if (safeArea) {
            _scrollController.jumpTo(0);
          }
        } else {
          if (!safeArea) {
            _scrollController.jumpTo(Get.height * .5);
          }
        }
      },
      child: ScrollableListTabView(
        tabHeight: 48,
        bodyAnimationDuration: const Duration(milliseconds: 150),
        tabAnimationCurve: Curves.easeOut,
        tabAnimationDuration: const Duration(milliseconds: 200),
        tabs: categoryData
            .map((category) => ScrollableListTab(
                tab: ListTab(
                  icon: SizedBox(),
                  label: category.categoryName!.trim().capitalize!,
                  activeBackgroundColor: AppConst.purple,
                  borderColor: Colors.transparent,
                ),
                body: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: category.productList!.length,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      ProductList items = category.productList![index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: height! * 20),
                        child: Container(
                          width: width! * 1000,
                          height: height! * 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: height! * 10,
                                horizontal: width! * 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width! * 300,
                                  height: height! * 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisSize: MainAxisSize.min,
                                         children: [
                                           Padding(
                                             padding: EdgeInsets.symmetric(vertical: 3),
                                             child: Text(
                                               items.itemName!,
                                               style: TextStyle(
                                                   color: Colors.black,
                                                   fontWeight: FontWeight.bold,
                                                   fontSize:
                                                   getSizeConfig.getPixels(20)),
                                             ),
                                           ),
                                           Padding(
                                             padding: EdgeInsets.symmetric(vertical: 3),
                                             child: Text(
                                               items.details!,
                                               style: TextStyle(
                                                   color: Colors.black,
                                                   fontWeight: FontWeight.normal,
                                                   fontSize:
                                                   getSizeConfig.getPixels(14)),
                                             ),
                                           ),
                                         ],
                                       ),
                                      Card(
                                        margin: EdgeInsets.only(top: width! * 20),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(width! * 20)),
                                        ),
                                        color: Colors.purple,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.local_fire_department,color: Colors.white,size: width!*50,),
                                            Padding(
                                              padding: EdgeInsets.all(width! * 15),
                                              child: Text(
                                                'Popular',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 3),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Tk ${(items.price!/2).toString()}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,

                                                  fontSize:
                                                      getSizeConfig.getPixels(16)),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              'Tk ${items.price.toString()}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  decoration: TextDecoration.lineThrough,
                                                  fontSize:
                                                      getSizeConfig.getPixels(16)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    width: width! * 300,
                                    height: width! * 300,
                                    child: Image(
                                      image: CachedNetworkImageProvider(items.imageURL!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })))
            .toList(),
      ),
    );
  }
}
