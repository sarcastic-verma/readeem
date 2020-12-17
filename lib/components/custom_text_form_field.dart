import 'package:flutter/material.dart';

import 'dart:math' as math show pi;

import 'package:readeem/utilities/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final Function(String) onChanged;
  final Function trailingFunction;
  final Function(String) onFieldSubmitted;
  final String defaultValue;
  final bool showTrailingWidget;
  final bool autoFocus;
  final String Function(String) validator;
  final TextInputAction textInputAction;
  final IconData icon;
  final bool flipIcon;
  final bool overrideLabel;

  CustomTextFormField(
      {@required this.labelText,
      @required this.onChanged,
      this.onFieldSubmitted,
      this.textInputAction,
      this.trailingFunction,
      this.showTrailingWidget = true,
      this.defaultValue,
      this.autoFocus = false,
      this.flipIcon = false,
      this.validator,
      this.overrideLabel = false,
      this.icon});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final Map<String, TextInputType> keyboardTypes = {
    'Email': TextInputType.emailAddress,
    'email': TextInputType.emailAddress,
    'Password': TextInputType.visiblePassword,
    'password': TextInputType.visiblePassword,
    'Phone': TextInputType.phone,
    'phone': TextInputType.phone,
  };

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted ?? (value) {},
      validator: widget.validator,
      initialValue: widget.defaultValue ?? '',
      textAlign: TextAlign.center,
      autofocus: widget.autoFocus,
      keyboardType: keyboardTypes[widget.labelText] ?? TextInputType.text,
      onChanged: widget.onChanged,
      obscureText: (widget.labelText == 'Password') ? !_showPassword : false,
      decoration: kTextFieldDecoration.copyWith(
        prefixIcon: widget.icon == null
            ? null
            : widget.flipIcon
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Icon(widget.icon),
                  )
                : Icon(widget.icon),
        suffixIcon: (widget.labelText == 'Password')
            ? IconButton(
                color: Theme.of(context).accentColor,
                icon: _showPassword
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
                iconSize: 30.0,
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              )
            : null,
        hintText: widget.overrideLabel
            ? widget.labelText
            : 'Enter ${widget.labelText}',
        labelText: widget.labelText,
      ),
    );
  }
}
