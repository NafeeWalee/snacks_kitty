import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';

import 'package:pure.international.snackskitty.customer/main_app/utils/controller/sizeConfig.dart';
import 'package:pure.international.snackskitty.customer/main_app/widgets/iconButton.dart';
import 'package:pure.international.snackskitty.customer/users/Screens/homePageTabs/Delivery.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin,TickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  GetSizeConfig getSizeConfig = Get.find();
  double width;
  double height;

  bool hasConnection;
  Future _dialog;
  var currentStatus;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  TabController tabController;
  int tabIndex = 0;

  List<Widget> screens = [
    Delivery(),
    Delivery(),
    Delivery(),
  ];
  @override
  void initState() {
    if (!mounted) {
      return;
    } else {
      super.initState();
      setInitialScreenSize();
      initConnectivity();

      tabController = TabController(length: 3, vsync: this);
      tabController.addListener(_handleTabSelection);

      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    }
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    tabController.dispose();
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
    ConnectivityResult result;
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
    var connection = await checkConnection();
    if (!connection) {
      Get.snackbar('Connection Issue', 'Fluctuating Network Detected!',
          backgroundColor: Colors.black,
          colorText: Colors.white,
          margin: EdgeInsets.only(
              bottom: height * 20, left: width * 15, right: width * 15),
          snackPosition: SnackPosition.BOTTOM);
    } else {
     // LocalNotification.showNotification('SnacksKitty', 'Welcome home, nyah!!');
    }
    print('init result: ${currentStatus.toString()}');
  }

  Future showDialog() {
    return AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.WARNING,
      body: Center(
        child: Text(
          'No connection to Internet found!',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      title: 'Network Issue',
      desc: 'No Stable connection found!',
      btnOkText: 'Settings',
      btnOkOnPress: () {
        AppSettings.openWIFISettings();
      },
      btnCancelText: 'Exit',
      btnCancelOnPress: () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop', true);
      },
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      onDissmissCallback: () {
        print('callback result: ${currentStatus.toString()}');
        if (ConnectivityResult.none == currentStatus) {
          _dialog = showDialog();
        } else {
          _dialog = null;
        }
      },
    ).show();
  }

  Future<bool> checkConnection() async {
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
          appBar: AppBar(
            elevation: 10,
            title: Row(
              children: [
                IconButtonConstraints(
                    function: () {

                    },
                    icon: Icons.dehaze,
                    color: Colors.purple,
                    size: 30),
                SizedBox(width: width*50,height: height*10,),
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
                  index: tabController.index,
                ),
              ),
            ],
          )
        ),
    );
  }
}
