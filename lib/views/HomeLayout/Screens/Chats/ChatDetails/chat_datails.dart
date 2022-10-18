import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/auth_cycle/model/user_model.dart';
import 'package:media_app/const/variable.dart';
import 'package:media_app/views/Cubit/cubit.dart';
import 'package:media_app/views/HomeLayout/Screens/Chats/ChatDetails/component/build_message.dart';
import 'package:media_app/views/HomeLayout/Screens/Chats/ChatDetails/component/build_my_message.dart';

// ignore: must_be_immutable
class ChatDetials extends StatelessWidget {
  UserModel? userModel;

  ChatDetials({
    this.userModel,
  });

  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      SocialCubit.of(context).getMessages(
        receiverId: userModel!.uId.toString(),
      );
      return BlocConsumer(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        '${userModel!.image}',
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      '${userModel!.name}',
                    ),
                  ],
                ),
              ),
              body: ConditionalBuilder(
                condition: SocialCubit.of(context).messages.length > 0,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                var message =
                                    SocialCubit.of(context).messages[index];
                                if (SocialCubit.of(context).usermodel!.uId ==
                                    message.senderId)
                                  return BuildMyMessage(message);
                                return BuildMessage(message);
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 15.0,
                                  ),
                              itemCount:
                                  SocialCubit.of(context).messages.length)),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(15.0)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  child: TextFormField(
                                    controller: messageController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'type your message here ...',
                                    ),
                                  )),
                            ),
                            Container(
                                height: 50.0,
                                color: defaultColor,
                                child: MaterialButton(
                                  onPressed: () {
                                    SocialCubit.of(context).sendMessage(
                                        receiverId: '${userModel!.uId}',
                                        dateTime: DateTime.now().toString(),
                                        text: messageController.text);
                                  },
                                  minWidth: 1.0,
                                  child: Icon(
                                    Icons.send,
                                    size: 16.0,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          });
    });
  }
}
