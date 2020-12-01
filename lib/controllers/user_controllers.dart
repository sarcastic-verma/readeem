import 'package:get/get.dart';
import 'package:readeem/model/user.dart';

class UserController extends GetxController {
  Rx<User> user = User().obs;

  updateUser(User updatedUser) {
    user.update((value) {
      value = updatedUser;
    });
  }
}
