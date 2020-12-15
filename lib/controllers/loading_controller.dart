import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  Map<String,bool> loadingMap = {};

  bool getLoadingStatus({@required String key}) {
    return loadingMap[key] ?? false;
  }

  void startLoading({@required String key}) {
    loadingMap[key] = true;
    update();
  }

  void stopLoading({@required String key}) {
    loadingMap[key] = false;
    update();
  }
}
