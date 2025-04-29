import 'package:bookly_app_t/core/resources/app_padding.dart';
import 'package:bookly_app_t/features/login/logic/login_cubit.dart';
import 'package:bookly_app_t/features/login/views/widget/bloc_consumer_login.dart';
import 'package:bookly_app_t/features/login/views/widget/coulmn_textform_w.dart';
import 'package:bookly_app_t/features/login/views/widget/dont_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/resources/app_color.dart';
import '../../../core/widget/custom_logo.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final fixedSizeHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginCubit(),
  child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomCenter,
                colors: [
                  AppColor(context).whiteColor ,
                  AppColor(context).highlightColor,
                  AppColor(context).blackColor,
                ]
            )
        ),
        child: Center(
          child: Padding(
            padding: AppPadding.hMLR(context: context),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customLogo(context: context,),
                  const SizedBox(height: 100),
                  const TextFormColum(),
                  SizedBox(height: fixedSizeHeight * 0.03),
                  Column(
                    children: [
                      const BlocConsumerLogin(),
                      dontHaveAccount(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
);
  }
}
