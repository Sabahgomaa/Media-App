import 'package:flutter/material.dart';
import 'package:media_app/const/variable.dart';
import 'package:media_app/views/models/message_model.dart';

// ignore: must_be_immutable
class BuildMyMessage extends StatelessWidget {
  MessageModel? model;

  BuildMyMessage(MessageModel message);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration: BoxDecoration(
          color: defaultColor,
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(
              10.0,
            ),
            topStart: Radius.circular(
              10.0,
            ),
            topEnd: Radius.circular(
              10.0,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child: Text('${model!.text}'),
      ),
    );
  }
}
