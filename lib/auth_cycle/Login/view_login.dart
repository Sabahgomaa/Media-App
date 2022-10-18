import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_app/auth_cycle/Login/Cubit/cubit.dart';
import 'package:media_app/auth_cycle/Login/Cubit/state.dart';
import 'package:media_app/auth_cycle/Login/units/login_footer.dart';
import 'package:media_app/auth_cycle/Login/units/login_header.dart';
import 'package:media_app/auth_cycle/Login/units/loginform.dart';
import 'package:media_app/views/HomeLayout/view.dart';
import 'package:media_app/widgets/nav_to.dart';
import 'package:media_app/widgets/show_toast.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child:
            BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
          if (state is LoginSuccessState) {
            // CacheHelper.saveData(key: 'uId', value: state.uId)
            //.then((value) =>
            navigateTo(context, HomeLayout());
          }
        }, builder: (context, state) {
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  child: Column(children: [
                    LoginHeader(),
                    SizedBox(
                      height: 40.0,
                    ),
                    LoginFields(),
                    SizedBox(
                      height: 10.0,
                    ),
                    LoginFooter(),
                  ]),
                ),
              ),
            ),
          ));
        }));
  }
}
