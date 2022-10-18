import 'package:flutter/material.dart';
import 'package:media_app/views/models/message_model.dart';

// ignore: must_be_immutable
class BuildMessage extends StatelessWidget {
  MessageModel? model;
  BuildMessage(MessageModel message);
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10.0),
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
        ));
  }
}
