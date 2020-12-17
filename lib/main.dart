import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readeem/views/auth_screen.dart';
import 'package:readeem/views/home_screen.dart';
import 'package:readeem/views/splash_screen.dart';

import 'getX_controllers/loading_getX_controller.dart';
import 'getX_controllers/user_getX_controllers.dart';

void main() {
  runApp(MyApp());
}

// user logs in 1st time - 2 tokens issued -> stored in SP

// user restarts app when access token is not expired -> take that token -> ringa ringa roses

// user restarts app when access token is expired -> sends authorized req -> refresh token used to fetch new pairs of token -> store in SP

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Readeem',
      home: SplashScreen(),
      initialBinding: BindingsBuilder(
        () => {
          Get.put(LoadingGetXController(), permanent: true),
          Get.put(UserGetXController())
        },
      ),
      getPages: [
        GetPage(
          name: AuthScreen.id,
          page: () => AuthScreen(),
        ),
        GetPage(
          name: HomeScreen.id,
          page: () => HomeScreen(),
        ),
      ],
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}
