import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TokensGetXController extends GetxController {
  TokensGetXController({this.accessToken = '', this.refreshToken = ''});

  String accessToken;
  String refreshToken;

  void updateTokens({@required String accessToken, String refreshToken}) {
    accessToken = accessToken;
    refreshToken = refreshToken;
    update();
  }

  factory TokensGetXController.fromJsonObject(Map<String, dynamic> tokens) {
    return TokensGetXController(
      refreshToken: tokens['refreshToken'],
      accessToken: tokens['accessToken'],
    );
  }
}
