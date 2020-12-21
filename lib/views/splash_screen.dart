import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:readeem/getX_controllers/tokens_getX_controller.dart';
import 'package:readeem/utilities/log_help.dart';
import 'package:readeem/utilities/routes.dart';
import 'package:readeem/views/connection_lost_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  static const id = '/splash';

  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future performInitialTasks() async {
    try {
      await Dio().get(pingServer);
      final sharedPref = await SharedPreferences.getInstance();
      logger.d(sharedPref.getString('accessToken'));
      logger.d(sharedPref.getString('refreshToken'));
      Get.offAllNamed(AuthScreen.id);
    } catch (e) {
      Get.offAllNamed(ConnectionLostScreen.id);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    performInitialTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitWave(color: Theme.of(context).accentColor)),
    );
  }
}
