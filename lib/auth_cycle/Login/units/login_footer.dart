import 'package:flutter/material.dart';
import 'package:media_app/auth_cycle/signup/view_signup.dart';
import 'package:media_app/const/variable.dart';

class LoginFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignupScreen()));
          },
          child: Text(
            'Sign Up',
            style: TextStyle(color: defaultColor),
          ),
        ),
      ],
    );
  }
}
