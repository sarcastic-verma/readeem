import 'package:get/get.dart';
import 'package:readeem/model/user.dart';

class UserGetXController extends GetxController {
  Rx<User> user = User(name: null, mobile: null).obs;

  updateUser(User updatedUser) {
    user.update((value) {
      value = updatedUser;
    });
  }
}
