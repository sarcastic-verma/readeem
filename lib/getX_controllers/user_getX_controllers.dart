import 'package:get/get.dart';
import 'package:readeem/model/user.dart';

class UserGetXController extends GetxController {
  Rx<User> user = User(
    name: null,
    previousOrders: null,
    changePasswordDate: null,
    reward: null,
    id: null,
    joinDate: null,
    mobile: null,
    img: null,
    email: null,
    cart: null,
    favBooks: null,
    completedBooks: null,
    inProgressBooks: null,
  ).obs;

  updateUser(User updatedUser) {
    user.value = updatedUser;
  }
}
