import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_app/const/variable.dart';

class CustomeButton extends StatelessWidget {
  final String text;
  final Function() function;
  final bool? isUpperCase;
  const CustomeButton(
      {required this.text, required this.function, this.isUpperCase});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          // isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: defaultColor,
      ),
    );
  }
}
