import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/const/icons.dart';
import 'package:media_app/views/Cubit/cubit.dart';
import 'package:media_app/views/Cubit/states.dart';
import 'package:media_app/widgets/button.dart';
import 'package:media_app/widgets/text_button.dart';
import 'package:media_app/widgets/text_field.dart';

// ignore: must_be_immutable
class EditProfile extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var userModel = SocialCubit.of(context).usermodel;
          var profileImage = SocialCubit.of(context).profileImage;
          File? coverImage = SocialCubit.of(context).coverImage;
          nameController.text = userModel!.name!;
          phoneController.text = userModel.phone!;
          bioController.text = userModel.bio!;
          return Scaffold(
              appBar: AppBar(
                title: Text('Edit Profile'),
                actions: [
                  CustomeTextButton(
                    function: () {
                      SocialCubit.of(context).updateUser(
                          name: nameController.text,
                          phone: phoneController.text,
                          bio: bioController.text);
                    },
                    text: 'Update',
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
              body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        if (state is SocialUserUpdateLoadingState)
                          LinearProgressIndicator(),
                        if (state is SocialUserUpdateLoadingState)
                          SizedBox(
                            height: 10.0,
                          ),
                        Container(
                            height: 190,
                            child: Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  Align(
                                    child: Stack(
                                        alignment: AlignmentDirectional.topEnd,
                                        children: [
                                          Container(
                                            height: 140,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.0,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.0,
                                                  ),
                                                ),
                                                image: DecorationImage(
                                                  image: coverImage == null
                                                      ? NetworkImage(
                                                          "${userModel.cover}")
                                                      : FileImage(coverImage),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                SocialCubit.of(context)
                                                    .getCoverImage();
                                              },
                                              icon: CircleAvatar(
                                                radius: 20,
                                                child: Icon(
                                                  IconBroken.Camera,
                                                  size: 16.0,
                                                ),
                                              ))
                                        ]),
                                    alignment: AlignmentDirectional.topCenter,
                                  ),
                                  Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        CircleAvatar(
                                          radius: 64.0,
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          child: CircleAvatar(
                                              radius: 60.0,
                                              backgroundImage: profileImage ==
                                                      null
                                                  ? NetworkImage(
                                                      '${userModel.image}')
                                                  : FileImage(profileImage)),
                                        )
                                      ]),
                                  IconButton(
                                    icon: CircleAvatar(
                                      radius: 20.0,
                                      child: Icon(
                                        IconBroken.Camera,
                                        size: 16.0,
                                      ),
                                    ),
                                    onPressed: () {
                                      SocialCubit.of(context).getProfileImage();
                                    },
                                  )
                                ])),
                        SizedBox(
                          height: 20.0,
                        ),
                        if (SocialCubit.of(context).profileImage != null ||
                            SocialCubit.of(context).coverImage != null)
                          Row(children: [
                            if (SocialCubit.of(context).profileImage != null)
                              Expanded(
                                child: Column(children: [
                                  CustomeButton(
                                    function: () {
                                      SocialCubit.of(context)
                                          .uploadProfileImage(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        bio: bioController.text,
                                      );
                                    },
                                    text: 'upload Profile',
                                  ),
                                  if (state is SocialUserUpdateLoadingState)
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                  if (state is SocialUserUpdateLoadingState)
                                    LinearProgressIndicator(),
                                ]),
                              )
                          ]),
                        if (SocialCubit.of(context).profileImage != null ||
                            SocialCubit.of(context).coverImage != null)
                          SizedBox(
                            height: 20.0,
                          ),
                        CustomeTextFormField(
                          controller: nameController,
                          type: TextInputType.text,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'name must not be empty';
                            }
                            return null;
                          },
                          label: 'Name',
                          prefix: IconBroken.User,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomeTextFormField(
                          controller: bioController,
                          type: TextInputType.text,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'bio must not be empty';
                            }
                            return null;
                          },
                          label: 'Bio',
                          prefix: IconBroken.Info_Circle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomeTextFormField(
                          controller: phoneController,
                          type: TextInputType.text,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'phone must not be empty';
                            }
                            return null;
                          },
                          label: 'Phone',
                          prefix: IconBroken.Call,
                        ),
                      ]))));
        });
  }
}
