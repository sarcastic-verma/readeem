import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  RxMap loadingMap = {}.obs;

  bool getLoadingStatus({@required String key}) {
    return loadingMap[key] ?? false;
  }

  void startLoading({@required String key}) {
    loadingMap[key] = true;
  }

  void stopLoading({@required String key}) {
    loadingMap[key] = false;
  }
}
