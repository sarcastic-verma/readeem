import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Text('Home'),
        ),
      ),
    );
  }
}
