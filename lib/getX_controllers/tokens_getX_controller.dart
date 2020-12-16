import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TokensGetXController extends GetxController{
  TokensGetXController({@required this.accessToken, @required this.refreshToken});

  String accessToken;
  String refreshToken;

  void startLoading({@required String accessToken}) {
    accessToken = accessToken;
    update();
  }
  factory TokensGetXController.fromJsonObject(Map<String, dynamic> tokens) {
    return TokensGetXController(
      refreshToken: tokens['refreshToken'],
      accessToken: tokens['accessToken'],
    );
  }
}
