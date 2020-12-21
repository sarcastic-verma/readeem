import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as Get;
import 'package:readeem/getX_controllers/tokens_getX_controller.dart';
import 'package:readeem/model/user.dart';
import 'package:readeem/utilities/log_help.dart';
import 'package:readeem/utilities/routes.dart';
import 'package:readeem/utilities/unauthorized_wrapper.dart';

class UserController {
  static Future<User> editUserController() async {
    try {
      Dio _dio = Dio(
        BaseOptions(
          headers: {
            'Authorization':
                'Bearer ${Get.Get.find<TokensGetXController>().accessToken}',
            // 'X-Requested-With': 'XMLHttpRequest',
          },
          contentType: Headers.formUrlEncodedContentType,
        ),
      )..interceptors.addAll([unauthorizedWrapper()]);
    } catch (err) {
      logger.e(err);
      return null;
    }

    return User(
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
    );
  }

  static Future<Map<String,dynamic>> loginController(
      {@required String email, @required String password}) async {
    try {
      Dio _dio = Dio();
      final response =
          await _dio.post(login, data: {'email': email, 'password': password});
      if (response.data['status'] == 'success') {
        return {
          'user': User.fromJson(response.data['user']),
          'tokens': TokensGetXController.fromJsonObject({
            'refreshToken': response.data['refreshToken'],
            'accessToken': response.data['accessToken']
          })
        };
      }
    } catch (err) {
      if (err is DioError) {
        logger.e(err.response);
        return {'errorMessage': err.response.data['message']};
      } else {
        logger.e(err);
        return {'errorMessage': 'An unknown error occurred, contact the team.'};
      }
    }
  }
}
