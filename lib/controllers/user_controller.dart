import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as Get;
import 'package:readeem/getX_controllers/tokens_getX_controller.dart';
import 'package:readeem/model/user.dart';
import 'package:readeem/utilities/catchDioError.dart';
import 'package:readeem/utilities/routes.dart';
import 'package:readeem/utilities/unauthorized_wrapper.dart';

class UserController {
  static Future<Map<String, dynamic>> editUserController(
      {@required String name,
      @required String email,
      @required String password,
      @required String mobile,
      @required String imgHash}) async {
    try {
      Dio _dio = Dio(
        BaseOptions(
          headers: {
            'Authorization':
                'Bearer ${Get.Get.find<TokensGetXController>().accessToken}',
          },
          contentType: Headers.formUrlEncodedContentType,
        ),
      )..interceptors.addAll([unauthorizedWrapper()]);
      final response = await _dio
          .patch(editUser, data: {name, email, password, mobile, imgHash});
      if (response.data['status'] == 'success') {
        return {'user': User.fromJson(response.data['user'])};
      } else {
        return null;
      }
    } catch (err) {
      return catchDioError(err);
    }
  }
}
