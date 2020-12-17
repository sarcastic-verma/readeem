import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readeem/components/custom_text_form_field.dart';
import 'package:readeem/components/wave_widget.dart';

// ignore: must_be_immutable
class AuthScreen extends StatelessWidget {
  static const id = '/auth';
  final _formKey = GlobalKey<FormState>();
  String password, email;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
              "Login",
              style: Theme.of(context).textTheme.headline1.copyWith(
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
              padding:
                  EdgeInsets.only(top: size.height * 0.40, right: 20, left: 20),
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: "Email",
                    onChanged: (val) {
                      email = val;
                    },
                  ),
                  SizedBox(height: 15,),
                  CustomTextFormField(
                    labelText: "Password",
                    onChanged: (val) {
                      password = val;
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
