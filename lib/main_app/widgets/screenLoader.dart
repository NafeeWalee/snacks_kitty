import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';

class IsScreenLoading extends StatelessWidget {

  final bool isLoading;
  final Widget child;
  IsScreenLoading({@required this.isLoading, @required this.child});

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      progressIndicator: SpinKitFoldingCube(
        color: Colors.pink,
      ),
      color: Colors.grey,
      child: child,
    );
  }
}