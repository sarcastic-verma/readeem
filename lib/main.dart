import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readeem/controllers/loading_controller.dart';
import 'package:readeem/controllers/user_controllers.dart';
import 'package:readeem/views/home_screen.dart';
import 'package:readeem/views/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Readeem',
      home: SplashScreen(),
      initialBinding: BindingsBuilder(
        () => {
          Get.put(LoadingController(), permanent: true),
          Get.put(UserController())
        },
      ),
      getPages: [GetPage(name: HomeScreen.id, page: () => HomeScreen())],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
