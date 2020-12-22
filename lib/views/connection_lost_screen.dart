import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readeem/utilities/log_help.dart';
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
                  navigator.popAndPushNamed(pageName);
                } catch (e) {
                  logger.e(e);
                  if (e is DioError) {
                    if (e.error is SocketException) {
                      logger.e(e.error);
                    }
                  }
                  Get.snackbar(
                    "Network Error",
                    "Oops, can't find server!!!",
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
