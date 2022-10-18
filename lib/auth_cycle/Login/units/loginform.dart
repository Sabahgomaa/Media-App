import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/auth_cycle/Login/Cubit/cubit.dart';
import 'package:media_app/auth_cycle/Login/Cubit/state.dart';
import 'package:media_app/views/HomeLayout/view.dart';
import 'package:media_app/widgets/button.dart';
import 'package:media_app/widgets/text_field.dart';

// ignore: must_be_immutable
class LoginFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var emailController = TextEditingController();
              var formKey = GlobalKey<FormState>();
              var isPassword = true;
              var passwordController = TextEditingController();
              var cubit = LoginCubit.of(context);
              return BlocProvider(
                  create: (BuildContext context) => LoginCubit(),
                  child: BlocConsumer<LoginCubit, LoginStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Form(
                            key: formKey,
                            child: Column(children: [
                              CustomeTextFormField(
                                controller: emailController,
                                label: 'Email',
                                type: TextInputType.emailAddress,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'email address must not be empty';
                                  }
                                  return null;
                                },
                                prefix: Icons.email_outlined,
                                isPassword: false,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              CustomeTextFormField(
                                controller: passwordController,
                                label: 'Password',
                                type: TextInputType.visiblePassword,
                                suffix: cubit.suffix,
                                onSubmit: (value) {
                                  if (formKey.currentState!.validate()) {}
                                },
                                isPassword: isPassword,
                                suffixPressed: () {
                                  cubit.changePasswordVisibility();
                                },
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'password is too short';
                                  }
                                },
                                prefix: Icons.lock_outline,
                              ),
                              // BlocConsumer(
                              //     listener: (context, state) {},
                              //     builder: (context, state) =>
                              ConditionalBuilder(
                                  condition: state is! LoginLoadingState,
                                  fallback: (context) =>
                                      CircularProgressIndicator(),
                                  builder: (context) => Column(children: [
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        CustomeButton(
                                          function: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              await cubit.userLogin(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeLayout()));
                                            }
                                          },
                                          text: 'login',
                                          isUpperCase: true,
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                      ]))
                            ]));
                      }));
            }));
  }
}
