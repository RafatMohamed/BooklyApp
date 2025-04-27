import 'package:bookly_app_t/features/login/logic/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../features/register/logic/register_cubit.dart';
import 'default_text_form_field_app.dart';

Widget customTextFormEmailLogin(context) {
  final cubitLogin = LoginCubit.get(context);
return TextFormFieldApp(
    suffixIcon: const Icon(Icons.email, color: Colors.white),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "pleaseEnterYourEmail".tr();
      } else if (!value.contains("@")) {
        return "pleaseEnterValidEmail".tr();
      }
      return null;
    },
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.emailAddress,
    labelText: "email".tr(),
    hintText: 'pleaseEnterYourEmail'.tr(),
    onSubmitted: (email) {
      cubitLogin.emailController.text=email;
    },
    controller: cubitLogin.emailController,
    onChange: (_) {},
  );
}

Widget customTextFormEmailRegister(context) {
  final cubitRegister = RegisterCubit.get(context);
  return TextFormFieldApp(
    suffixIcon: const Icon(Icons.email, color: Colors.white),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "pleaseEnterYourEmail".tr();
      } else if (!value.contains("@")) {
        return "pleaseEnterValidEmail".tr();
      }
      return null;
    },
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.emailAddress,
    labelText: "email".tr(),
    hintText: 'pleaseEnterYourEmail'.tr(),
    onSubmitted: (email) {
      cubitRegister.emailController.text=email;
    },
    controller: cubitRegister.emailController,
    onChange: (_) {},
  );
}
