import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:readeem/controllers/loading_controller.dart';

class LoadingWrapper extends StatelessWidget {
  final Widget child;

  LoadingWrapper({@required this.child});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Stack(
        children: [
          child,
          Container(
            width: double.infinity,
            height: double.infinity,
            child: SpinKitWave(
              color: Theme.of(context).accentColor,
            ),
          )
        ],
      ),
      onWillPop: () =>
          Future.value(!Get.find<LoadingController>().isLoading.value),
    );
  }
}
