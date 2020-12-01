import 'package:get/get.dart';

class LoadingController extends GetxController {
  RxBool isLoading = false.obs;

  void changeLoadingStatus() {
    this.isLoading.value = !this.isLoading.value;
  }
}
