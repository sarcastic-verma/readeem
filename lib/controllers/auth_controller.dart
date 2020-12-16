import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as Get;
import 'package:readeem/model/user.dart';
import 'package:http_parser/http_parser.dart';
import 'package:readeem/utilities/unauthorized_wrapper.dart';

class AuthController {
  static Future<User> login(
      {@required String password, @required String email}) async {
    Map<String, dynamic> user;
    return User.fromJson(user);
  }

  static Future<User> signUp(
      {@required String name,
      @required String email,
      @required String mobile,
      @required bool isThirdParty,
      File img,
      String password = ''}) async {
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
      Dio _dio = Dio()..interceptors.addAll([unauthorizedWrapper()]);
      Map<String, dynamic> user;
      return User.fromJson(user);
    } catch (err) {
      return null;
    }
  }

  static Future forgotPassword({@required String email}) async {}

  static Future changePassword() async {}

  static Future resetPassword() async {}

  static Future logout() async {}
}
