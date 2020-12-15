import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:readeem/views/home_screen.dart';

import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  static const id = '/splash';

  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SpinKitWave(color: Theme.of(context).accentColor),
          FlatButton(
            onPressed: () => {Get.offAndToNamed(AuthScreen.id)},
            child: Text('go'),
          )
        ],
      ),
    );
  }
}
