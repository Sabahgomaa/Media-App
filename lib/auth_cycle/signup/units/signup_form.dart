import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/auth_cycle/signup/cubit/cubit.dart';
import 'package:media_app/auth_cycle/signup/cubit/states.dart';
import 'package:media_app/widgets/button.dart';
import 'package:media_app/widgets/text_field.dart';

// ignore: must_be_immutable
class SignUpForm extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var isPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          // if (state is SignUpSuccessState) if (state.signUpModel.status!) {
          //   print(state.signUpModel.message!);
          //   print(state.signUpModel.data!.token!);

          // CacheHelper.saveData(
          //         key: 'token', value: state.signUpModel.data!.token)
          //     .then((value) {
          //   // token = state.signUpModel.data!.token!;
          //   navigateAndFinish(context, HomeLayout());
          //     });
          //   } else {
          //     print(state.signUpModel.message);
          //   }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(children: [
              CustomeTextFormField(
                controller: nameController,
                label: 'Name',
                type: TextInputType.name,
                isPassword: false,
                validate: (value) {
                  if (value.isEmpty) {
                    return 'Name must not be empty';
                  }
                  return null;
                },
                onChange: (String value) {
                  print(value);
                },
                onSubmit: (String value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomeTextFormField(
                isPassword: false,
                controller: emailController,
                label: 'Email',
                type: TextInputType.emailAddress,
                validate: (value) {
                  if (value.isEmpty) {
                    return 'email address must not be empty';
                  }
                  return null;
                },
                onChange: (String value) {
                  print(value);
                },
                onSubmit: (String value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomeTextFormField(
                  controller: passwordController,
                  label: 'Password',
                  suffix: SignUpCubit.of(context).suffix,
                  type: TextInputType.visiblePassword,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'password is too short';
                    }

                    return null;
                  },
                  isPassword: SignUpCubit.of(context).isPassword,
                  suffixPressed: () {
                    SignUpCubit.of(context).changePasswordVisibility();
                  }),
              SizedBox(
                height: 15.0,
              ),
              CustomeTextFormField(
                isPassword: false,
                controller: phoneController,
                label: 'Phone',
                type: TextInputType.number,
                validate: (value) {
                  if (value.isEmpty) {
                    return 'Name must not be empty';
                  }
                  return null;
                },
                onChange: (String value) {
                  print(value);
                },
                onSubmit: (String value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ConditionalBuilder(
                condition: state is! SignUpLoadingState,
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
                builder: (context) => CustomeButton(
                  text: 'SIGN UP',
                  function: () {
                    if (formKey.currentState!.validate()) {
                      SignUpCubit.of(context).userSignUp(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          phone: phoneController.text);
                    }
                  },
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
