import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:readeem/getX_controllers/loading_getX_controller.dart';

class LoadingWrapper extends StatelessWidget {
  final Widget child;
  final String id;

  LoadingWrapper({@required this.child, @required this.id});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadingGetXController>(builder: (controller) {
      return WillPopScope(
        child: Stack(
          children: [
            child,
            controller.getLoadingStatus(key: id)
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: SpinKitWave(
                      color: Theme.of(context).accentColor,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
        onWillPop: () => Future.value(!controller.getLoadingStatus(key: id)),
      );
    });
  }
}
