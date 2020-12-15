import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readeem/components/LoadingWrapper.dart';
import 'package:readeem/controllers/loading_controller.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LoadingWrapper(
        id: id,
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Text('Home'),
                FlatButton(
                  onPressed: () {
                    Get.find<LoadingController>().startLoading(key: id);
                  },
                  child: Text("Load me"),
                ),
                FlatButton(
                  onPressed: () {
                    Get.find<LoadingController>().stopLoading(key: id);
                  },
                  child: Text("Load me"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
