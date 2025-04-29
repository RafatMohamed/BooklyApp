import 'package:bookly_app_t/features/login/logic/login_cubit.dart';
import 'package:bookly_app_t/features/login/logic/login_state.dart';
import 'package:bookly_app_t/features/register/logic/register_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/register/logic/register_cubit.dart';
import '../resources/app_color.dart';
import 'default_text_form_field_app.dart';


Widget customTextFormPasswordLogin(context) {
  final cubitLogin = LoginCubit.get(context);
  return BlocBuilder<LoginCubit, LoginState>(
    builder: (context, state) {
      return TextFormFieldApp(
        suffixIcon: IconButton(
          onPressed: () {
            cubitLogin.changePasswordVisibility();
          },
          icon: Icon(
            color: AppColor(context).whiteColor,
            cubitLogin.obscureText ? Icons.visibility_off_outlined : Icons
                .visibility_outlined,
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "pleaseEnterYourPassword".tr();
          } else if (value.length < 6) {
            return "passwordMustBeAtLeast6Characters".tr();
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        obscureText: cubitLogin.obscureText,
        labelText: "password".tr(),
        hintText: 'pleaseEnterYourPassword'.tr(),
        onSubmitted: (value) {
          cubitLogin.passwordController.text = value;
        },
        controller: cubitLogin.passwordController,
        onChange: (_) {},
      );
    },
  );
}

Widget customTextFormPasswordRegister(context) {
  final cubitRegister = RegisterCubit.get(context);
  return BlocBuilder<RegisterCubit, RegisterState>(
    builder: (context, state) {
      return TextFormFieldApp(
        suffixIcon: IconButton(
          onPressed: () {
            cubitRegister.changePasswordVisibility();
          },
          icon: Icon(
            color: AppColor(context).whiteColor,
            cubitRegister.obscureText ? Icons.visibility_off_outlined : Icons
                .visibility_outlined,
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "pleaseEnterYourPassword".tr();
          } else if (value.length < 6) {
            return "passwordMustBeAtLeast6Characters".tr();
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        obscureText: cubitRegister.obscureText,
        labelText: "password".tr(),
        hintText: 'pleaseEnterYourPassword'.tr(),
        onSubmitted: (value) {
          cubitRegister.passwordController.text = value;
        },
        controller: cubitRegister.passwordController,
        onChange: (_) {},
      );
    },
  );
}
