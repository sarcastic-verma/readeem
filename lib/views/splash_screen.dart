import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  static const id = '/splash';

  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future checkTokens() async {
    await Future.delayed(Duration(milliseconds: 0));
    Get.offAllNamed(AuthScreen.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkTokens();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitWave(color: Theme.of(context).accentColor)),
    );
  }
}
