import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:readeem/components/wave_widget.dart';

import 'custom_text_form_field.dart';

// ignore: must_be_immutable
class LoginSide extends StatelessWidget {
  final Size size;
  String password, email;
  final bool keyboardOpen;
  final VoidCallback toggleSide;
  final _formKey = GlobalKey<FormState>();

  LoginSide(
      {@required this.size,
      @required this.keyboardOpen,
      @required this.toggleSide});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.4,
              color: Theme.of(context).accentColor,
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 800),
              curve: Curves.easeOutQuad,
              top: keyboardOpen ? -size.height / 3.7 : 0.0,
              child: WaveWidget(
                size: size,
                yOffset: size.height / 3.0,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.10, left: 20),
              child: Text(
                "Welcome\nBack",
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontFamily: 'Apple SD Gothic Neo',
                      fontWeight: FontWeight.w400,
                      color: keyboardOpen
                          ? Theme.of(context).accentColor
                          : Colors.white,
                    ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                    top: keyboardOpen ? size.height * 0.34 : size.height * 0.40,
                    right: 20,
                    left: 20),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        labelText: "Email",
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        labelText: "Password",
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      ArgonButton(
                        height: 50,
                        width: size.width * 0.6,
                        borderRadius: 5.0,
                        color: Theme.of(context).accentColor,
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        loader: Padding(
                          padding: EdgeInsets.all(10),
                          child: SpinKitRotatingCircle(
                            color: Colors.white,
                            // size: loaderWidth ,
                          ),
                        ),
                        onTap: (startLoading, stopLoading, btnState) async {
                          if (btnState == ButtonState.Idle) {
                            startLoading();
                            await Future.delayed(Duration(seconds: 2));
                            stopLoading();
                          } else if (btnState == ButtonState.Busy) {
                            Get.snackbar(
                              "Loading",
                              "Please Wait",
                              snackPosition: SnackPosition.BOTTOM,
                              margin: EdgeInsets.all(15),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        keyboardOpen
            ? SizedBox.shrink()
            : RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 36),
                  children: <TextSpan>[
                    TextSpan(text: 'New here? '),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            toggleSide();
                          },
                        text: ' Sign up\n',
                        style: TextStyle(color: Colors.blue)),
                  ],
                ),
                textScaleFactor: 0.5,
              )
      ],
    );
  }
}
