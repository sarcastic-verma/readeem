import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:readeem/components/wave_widget.dart';
import 'package:readeem/controllers/auth_controller.dart';
import 'package:readeem/getX_controllers/tokens_getX_controller.dart';
import 'package:readeem/model/user.dart';
import 'package:readeem/views/auth_screen.dart';
import 'package:readeem/views/connection_lost_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_text_form_field.dart';

// ignore: must_be_immutable
class LoginSide extends StatelessWidget {
  final Size size;
  String password, email;
  final VoidCallback toggleSide;
  static final _formKey = GlobalKey<FormState>();
  final bool keyboardOpen = Get.mediaQuery.viewInsets.bottom > 0;

  LoginSide({@required this.size, @required this.toggleSide});

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
                            final response =
                                await AuthController.loginController(
                                    email: 'shivam@gmail.com',
                                    password: 'testPass');

                            if (response['errorMessage'] == null) {
                              User user = response['user'] as User;
                              TokensGetXController tokens =
                                  response['tokens'] as TokensGetXController;
                              Get.find<TokensGetXController>().updateTokens(
                                  accessToken: tokens.accessToken,
                                  refreshToken: tokens.refreshToken);
                              final sharedPref =
                                  await SharedPreferences.getInstance();
                              await sharedPref.setString(
                                  'accessToken', tokens.accessToken);
                              await sharedPref.setString(
                                  'refreshToken', tokens.refreshToken);
                            } else {
                              if (response['errorMessage'] == 'Server Down') {
                                navigator.pushNamed(ConnectionLostScreen.id,
                                    arguments: AuthScreen.id);
                              }
                              Get.snackbar(
                                "Error",
                                response['errorMessage'],
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                margin: EdgeInsets.all(15),
                              );
                            }
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
                            print('lol');
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
