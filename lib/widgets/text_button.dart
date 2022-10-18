import 'package:flutter/material.dart';
import 'package:media_app/const/variable.dart';

// ignore: must_be_immutable
class CustomeTextButton extends StatelessWidget {
  Function() function;
  String text;
  CustomeTextButton({required this.text, required this.function});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: defaultColor),
      ),
    );
  }
}
