import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readeem/utilities/routes.dart';

class ConnectionLostScreen extends StatelessWidget {
  static const id = '/connectionLost';
  final String pageName;

  ConnectionLostScreen({@required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Connection Lost,"),
            TextButton(
              child: Text('Re-try'),
              onPressed: () async {
                try {
                  await Dio().get(pingServer);
                  Get.offAllNamed(pageName);
                } catch (e) {
                  Get.snackbar(
                    "Network Error",
                    "Oops, can't find internet!!!",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    margin: EdgeInsets.all(15),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
