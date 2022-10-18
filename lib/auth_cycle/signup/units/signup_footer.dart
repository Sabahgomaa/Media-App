import 'package:flutter/material.dart';
import 'package:media_app/const/variable.dart';
import 'package:media_app/views/HomeLayout/view.dart';

class SignUpFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'already have an account?',
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeLayout()));
              },
              child: Text(
                'Login',
                style: TextStyle(color: defaultColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
