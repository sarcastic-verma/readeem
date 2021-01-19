import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as Get;
import 'package:readeem/getX_controllers/tokens_getX_controller.dart';
import 'package:readeem/model/user.dart';
import 'package:http_parser/http_parser.dart';
import 'package:readeem/utilities/catchDioError.dart';
import 'package:readeem/utilities/routes.dart';
import 'package:readeem/utilities/unauthorized_wrapper.dart';

class AuthController {
  static Future<Map<String, dynamic>> loginController(
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
      } else {
        return {'errorMessage': response.data['message']};
      }
    } catch (err) {
      return catchDioError(err);
    }
  }

  static Future<Map<String, dynamic>> signUpController({
    @required String name,
    @required String email,
    @required String mobile,
    @required String password,
    File img,
  }) async {
    try {
      FormData formData = new FormData.fromMap({
        "name": name,
        "email": email,
        "mobile": mobile,
      });
      if (img != null) {
        formData.files.add(
          MapEntry(
            "img",
            await MultipartFile.fromFile(
              img.path,
              filename: img.path.split('/').last,
              contentType: MediaType('image', 'jpg'),
            ),
          ),
        );
      }
      Dio _dio = Dio();
      final response =
          await _dio.post(signUp, data: {'email': email, 'password': password});
      if (response.data['status'] == 'success') {
        return {
          'user': User.fromJson(response.data['user']),
          'tokens': TokensGetXController.fromJsonObject({
            'refreshToken': response.data['refreshToken'],
            'accessToken': response.data['accessToken']
          })
        };
      } else {
        return {'errorMessage': response.data['message']};
      }
    } catch (err) {
      return catchDioError(err);
    }
  }

  static Future<Map<String, dynamic>> forgotPasswordController(
      {@required String email}) async {
    try {
      Dio _dio = Dio();
      final response = await _dio.post(forgotPassword, data: {email});
      if (response.data['status'] == 'success') {
        return {'message': 'Reset link sent on email.'};
      } else {
        return {'errorMessage': response.data['message']};
      }
    } catch (err) {
      return catchDioError(err);
    }
  }

  static Future<Map<String, dynamic>> changePasswordController(
      {@required String newPassword, @required String currentPassword}) async {
    try {
      Dio _dio = Dio(
        BaseOptions(
          headers: {
            'Authorization':
            'Bearer ${Get.Get.find<TokensGetXController>().accessToken}',
          },
        ),
      )..interceptors.add(unauthorizedWrapper());
      final response =
          await _dio.post(changePassword, data: {newPassword, currentPassword});
      if (response.data['status'] == 'success') {
        return {'message': 'Reset link sent on email.'};
      } else {
        return {'errorMessage': response.data['message']};
      }
    } catch (err) {
      return catchDioError(err);
    }
  }

  static Future<Map<String, dynamic>> logoutController() async {
    try {
      Dio _dio = Dio(
        BaseOptions(
          headers: {
            'Authorization':
                'Bearer ${Get.Get.find<TokensGetXController>().accessToken}',
          },
        ),
      )..interceptors.add(unauthorizedWrapper());
      final response = await _dio.get(logout);
      if (response.data['status'] == 'success') {
        return {'message': response.data['message']};
      } else {
        return {'errorMessage': response.data['message']};
      }
    } catch (err) {
      return catchDioError(err);
    }
  }
}
