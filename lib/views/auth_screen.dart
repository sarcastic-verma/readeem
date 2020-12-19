import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readeem/components/login_side.dart';
import 'package:readeem/components/signup_side.dart';

class AuthScreen extends StatefulWidget {
  static const id = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogIn = true;

  void toggleSide() {
    setState(() {
      isLogIn = !isLogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: child,
          );
        },
        child: isLogIn
            ? LoginSide(
                size: size,
                toggleSide: toggleSide,
              )
            : SignupSide(
                toggleSide: toggleSide,
                size: size,
              ),
      ),
    );
  }
}
