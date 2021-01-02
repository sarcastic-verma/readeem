import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
        return {'errorMessage': 'An unknown error occurred, contact the team.'};
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
        return {'errorMessage': 'An unknown error occurred, contact the team.'};
      }
    } catch (err) {
      return catchDioError(err);
    }
  }

  static Future forgotPassword({@required String email}) async {}

  static Future changePassword() async {}

  static Future resetPassword() async {}

  static Future logout() async {}
}
