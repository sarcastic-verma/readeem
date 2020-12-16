import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:readeem/views/auth_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

InterceptorsWrapper unauthorizedWrapper() {
  return InterceptorsWrapper(
    onError: (DioError error) async {
      if (error.response == null) {
        print(error);
      } else if (error.response.statusCode == 401) {
        final preferences = await SharedPreferences.getInstance();
        await preferences.remove('accessToken');
        await preferences.remove('refreshToken');
        Get.offAllNamed(AuthScreen.id);
      }
    },
  );
}
