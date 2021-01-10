import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readeem/views/auth_screen.dart';
import 'package:readeem/views/connection_lost_screen.dart';
import 'package:readeem/views/home_screen.dart';
import 'package:readeem/views/splash_screen.dart';

import 'getX_controllers/loading_getX_controller.dart';
import 'getX_controllers/tokens_getX_controller.dart';
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
          // permanent here suggests that these bindings should remain in memory.
          Get.put(LoadingGetXController(), permanent: true),
          Get.put(TokensGetXController(), permanent: true),
          Get.put(UserGetXController(), permanent: true)
        },
      ),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: AuthScreen.id,
          page: () => AuthScreen(),
        ),
        GetPage(
          name: ConnectionLostScreen.id,
          page: () => ConnectionLostScreen(
            pageName: AuthScreen.id,
          ),
        ),
        GetPage(
          name: HomeScreen.id,
          page: () => HomeScreen(),
        ),
      ],
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.indigo,
      ),
    );
  }
}
