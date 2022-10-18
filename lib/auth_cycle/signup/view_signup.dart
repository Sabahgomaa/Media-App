import 'package:flutter/material.dart';
import 'package:media_app/auth_cycle/signup/units/signup_footer.dart';
import 'package:media_app/auth_cycle/signup/units/signup_form.dart';
import 'package:media_app/auth_cycle/signup/units/signup_header.dart';

class SignupScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            SignUpHeader(),
            SignUpForm(),
            SignUpFooter(),
          ]),
        ),
      ),
    ));
  }
}
