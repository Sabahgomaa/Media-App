import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/views/Cubit/cubit.dart';
import 'package:media_app/views/Cubit/states.dart';
import 'package:media_app/views/HomeLayout/Screens/Chats/Component/build_chat_item.dart';
import 'package:media_app/widgets/my_divider.dart';

class ChatsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition: SocialCubit.of(context).users.length > 0,
              builder: (context) => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      BuildChatItem(SocialCubit.of(context).users[index]),
                  separatorBuilder: (context, index) => MyDivider(),
                  itemCount: SocialCubit.of(context).users.length),
              fallback: (context) => Center(
                    child: CircularProgressIndicator(),
                  ));
        });
  }
}
