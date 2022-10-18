import 'package:flutter/material.dart';
import 'package:media_app/const/icons.dart';
import 'package:media_app/const/variable.dart';
import 'package:media_app/views/Cubit/cubit.dart';
import 'package:media_app/views/models/post_model.dart';

class PostItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PostModel? model;
    var index;
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage('${model!.image}'),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${model.name}',
                            style: TextStyle(
                              height: 1.4,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: defaultColor,
                            size: 16.0,
                          ),
                        ],
                      ),
                      Text('${model.dateTime}',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                height: 1.4,
                              )),
                    ],
                  )),
                  SizedBox(
                    width: 15.0,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      size: 16.0,
                    ),
                    onPressed: () {},
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
                Text(
                  '${model.text}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     bottom: 10.0,
                //     top: 5.0,
                //   ),
                //   child: Container(
                //     width: double.infinity,
                //     child: Wrap(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsetsDirectional.only(
                //             end: 6.0,
                //           ),
                //           child: Container(
                //             height: 25,
                //             child: MaterialButton(
                //               onPressed: () {},
                //               minWidth: 1.0,
                //               padding: EdgeInsets.zero,
                //               child: Text(
                //                 '#software',
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .caption!
                //                     .copyWith(
                //                       color: defaultColor,
                //                     ),
                //               ),
                //             ),
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsetsDirectional.only(
                //             end: 6.0,
                //           ),
                //           child: Container(
                //             height: 25,
                //             child: MaterialButton(
                //               onPressed: () {},
                //               minWidth: 1.0,
                //               padding: EdgeInsets.zero,
                //               child: Text(
                //                 '#flutter',
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .caption!
                //                     .copyWith(color: defaultColor),
                //               ),
                //             ),
                //           ),
                //         )
                //                   ],
                //                 ),
                //               ),
                // ),
                if (model.postImage != '')
                  Padding(
                      padding: const EdgeInsetsDirectional.only(top: 15.0),
                      child: Container(
                          height: 140,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                  '${model.postImage}',
                                ),
                                fit: BoxFit.cover,
                              )))),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                    ),
                    child: Row(children: [
                      Expanded(
                          child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          child: Row(children: [
                            Icon(
                              IconBroken.Heart,
                              size: 16.0,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${SocialCubit.of(context).likes[index]}',
                              style: Theme.of(context).textTheme.caption,
                            )
                          ]),
                        ),
                        onTap: () {},
                      )),
                      Expanded(
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  IconBroken.Chat,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  '0 comment',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                      )
                    ])),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
                Row(children: [
                  Expanded(
                    child: InkWell(
                      child: Row(children: [
                        CircleAvatar(
                          radius: 18.0,
                          backgroundImage: NetworkImage(
                            '${SocialCubit.of(context).usermodel!.image}',
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'write a comment ...',
                          style:
                              Theme.of(context).textTheme.caption!.copyWith(),
                        ),
                      ]),
                      onTap: () {},
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Heart,
                          size: 16,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Like',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    onTap: () {},
                  )
                ])
              ],
            )));
  }
}
