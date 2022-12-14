import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/views/Cubit/cubit.dart';
import 'package:media_app/views/Cubit/states.dart';
import 'package:media_app/widgets/text_button.dart';

// ignore: must_be_immutable
class NewPostView extends StatelessWidget {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  ' Create Post',
                ),
                actions: [
                  CustomeTextButton(
                    function: () {
                      var now = DateTime.now();
                      if (SocialCubit.of(context).postImage == null) {
                        SocialCubit.of(context).createPost(
                            dateTime: now.toString(),
                            text: textController.text);
                      } else {
                        SocialCubit.of(context).uploadPostImage(
                            dataTime: now.toString(),
                            text: textController.text);
                      }
                    },
                    text: 'Post',
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  if (state is SocialCreatePostLoadingState)
                    LinearProgressIndicator(),
                  if (state is SocialCreatePostLoadingState)
                    SizedBox(
                      height: 10.0,
                    ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                          'https://image.freepik.com/free-photo/skeptical-woman-has-unsure-questioned-expression-points-fingers-sideways_273609-40770.jpg',
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Text(
                          'Abdullah Mansour',
                          style: TextStyle(
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'what is on your mind ...',
                      border: InputBorder.none,
                    ),
                  )),
                  SizedBox(
                    height: 20.0,
                  ),
                  if (SocialCubit.of(context).postImage != null)
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                4.0,
                              ),
                              image: DecorationImage(
                                image: FileImage(
                                    SocialCubit.of(context).postImage!),
                                fit: BoxFit.cover,
                              ),
                            )),
                        IconButton(
                            onPressed: () {
                              SocialCubit.of(context).removePostImage();
                            },
                            icon: CircleAvatar(
                              radius: 20.0,
                              child: Icon(
                                Icons.close,
                                size: 16.0,
                              ),
                            ))
                      ],
                    ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextButton(
                        onPressed: () {
                          SocialCubit.of(context).getPostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'add photo',
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            '# tags',
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ));
        });
  }
}
