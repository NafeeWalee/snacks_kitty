import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:pure.international.snackskitty.customer/main_app/utils/controller/sizeConfig.dart';
import 'package:pure.international.snackskitty.customer/main_app/widgets/iconButton.dart';

import 'homePageTabs/delivery/delivery.dart';
import 'homePageTabs/pickup/pickup.dart';
import 'homePageTabs/shops/shops.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin,TickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GetSizeConfig getSizeConfig = Get.find();
  double? width;
  double? height;

  bool? hasConnection;
  Future? _dialog;
  var currentStatus;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  TabController? tabController;
  int tabIndex = 0;

  List<Widget> screens = [
    Delivery(),
    Pickup(),
    Shops(),
  ];
  @override
  void initState() {
    if (!mounted) {
      return;
    } else {
      super.initState();
      setInitialScreenSize();
     // initConnectivity();
     // _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
      tabController = TabController(length: 3, vsync: this);
      tabController!.addListener(_handleTabSelection);
    }
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    tabController!.dispose();
    super.dispose();
  }

  setInitialScreenSize() {
    getSizeConfig.setSize(
      (Get.width -
              (Get.mediaQuery.padding.left + Get.mediaQuery.padding.right)) /
          1000,
      (Get.height -
              (Get.mediaQuery.padding.top + Get.mediaQuery.padding.bottom)) /
          1000,
    );

    width = getSizeConfig.width.value;
    height = getSizeConfig.height.value;
  }

  Future initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(status) async {
    currentStatus = status;
    switch (currentStatus) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        if (_dialog != null) {
          _dialog = null;
          Navigator.pop(context);
        }
        break;
      case ConnectivityResult.none:
        _dialog = showDialog();
        break;
      default:
        print(currentStatus.toString());
        break;
    }
    var connection = await (checkConnection() as FutureOr<bool>);
    if (!connection) {
      Get.snackbar('Connection Issue', 'Fluctuating Network Detected!',
          backgroundColor: Colors.black,
          colorText: Colors.white,
          margin: EdgeInsets.only(
              bottom: height! * 20, left: width! * 15, right: width! * 15),
          snackPosition: SnackPosition.BOTTOM);
    } else {
     // LocalNotification.showNotification('SnacksKitty', 'Welcome home, nyah!!');
    }
    print('init result: ${currentStatus.toString()}');
  }

  Future showDialog() {
    return Alert(
      context: context,
      style: alertStyle,
      type: AlertType.warning,
      content: Center(
        child: Text(
          'No connection to Internet found!',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      title: 'Network Issue',
      desc: 'No connection to Internet found!',
      buttons: [
        DialogButton(
          child: Text(
            "Settings",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () =>  AppSettings.openWIFISettings(),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "Exit",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop', true),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
      onWillPopActive: false,
      closeFunction: (){
        print('callback result: ${currentStatus.toString()}');
        if (ConnectivityResult.none == currentStatus) {
          _dialog = showDialog();
        } else {
          _dialog = null;
        }
      },
    ).show();
  }
  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.start,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
    alertAlignment: Alignment.topCenter,
  );

  Future<bool?> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    return hasConnection;
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
        onWillPop: () async {
          return Future.value(null);
        },
        child: Scaffold(
          key: scaffoldKey,
            drawerEnableOpenDragGesture: false,
            endDrawerEnableOpenDragGesture: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 10,
            title: Row(
              children: [
                IconButtonConstraints(
                    function: () {
                      if(scaffoldKey.currentState!.isDrawerOpen){
                        scaffoldKey.currentState!.openEndDrawer();
                      }else{
                        scaffoldKey.currentState!.openDrawer();
                      }
                    },
                    icon: Icons.dehaze,
                    color: Colors.purple,
                    size: 30, iconSize: 30,),
                SizedBox(width: width!*50,height: height!*10,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:4),
                      child: Text(
                        'Home',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                    Text('420, Big Kitty Castle',
                        style: TextStyle(color: Colors.black,fontSize: getSizeConfig.getPixels(14))),
                  ],
                )
              ],
            ),
          ),
          drawer: Drawer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: width!*1000,
                  height: height!*400,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                  ),
                 child: Align(
                   alignment: Alignment.bottomLeft,
                     child: GestureDetector(
                       onTap: (){

                       },
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: ListTile(
                           title: Text('Log in/ Create account',style: TextStyle(color: Colors.white,fontSize: getSizeConfig.getPixels(18),fontWeight: FontWeight.bold),),
                         ),
                       ),
                     ))
                ),
               TextButton(
                 onPressed: (){

                 },
                 child: ListTile(
                   leading: Icon(Icons.file_present,color: Colors.purple,),
                   title: Text('Orders'),
                 ),

               ),
                TextButton(
                  onPressed: (){

                  },
                  child: ListTile(
                    leading: Icon(Icons.help_outline,color: Colors.purple,),
                    title: Text('Helpline'),
                  ),

                ),
                TextButton(
                  onPressed: (){

                  },
                  child: ListTile(
                    title: Text('Settings'),
                  ),

                ),
                TextButton(
                  onPressed: (){

                  },
                  child: ListTile(
                    title: Text('Terms & Conditions/Privacy'),
                  ),

                ),
              ],
            ),
          ),
          body: Column(
            children: [
              TabBar(
                controller: tabController,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.purple,
                labelColor: Colors.purple,
                tabs: [
                  Tab(text: 'Delivery',),
                  Tab(text: 'Pick-Up',),
                  Tab(text: 'Shops',),
                ],
              ),
              Expanded(
                child: IndexedStack(
                  children: screens,
                  index: tabController!.index,
                ),
              ),
            ],
          )
        ),
    );
  }
}
