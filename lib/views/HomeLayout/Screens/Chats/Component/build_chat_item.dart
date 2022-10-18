import 'package:flutter/material.dart';
import 'package:media_app/auth_cycle/model/user_model.dart';
import 'package:media_app/views/HomeLayout/Screens/Chats/ChatDetails/chat_datails.dart';
import 'package:media_app/widgets/nav_to.dart';

// ignore: must_be_immutable
class BuildChatItem extends StatelessWidget {
  UserModel? model;

  BuildChatItem(this.model);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
            context,
            ChatDetials(
              userModel: model,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage('${model!.image}'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              '${model!.name}',
              style: TextStyle(height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
