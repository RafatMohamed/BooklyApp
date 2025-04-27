import 'package:bookly_app_t/features/login/logic/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../features/register/logic/register_cubit.dart';
import 'default_text_form_field_app.dart';

Widget customTextFormPasswordLogin(context) {
  final cubitLogin = LoginCubit.get(context);
  return  TextFormFieldApp(
    suffixIcon: IconButton(
      onPressed: () {},
      icon: const Icon(
        color: Colors.white, Icons.visibility_off ,
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
    obscureText: false,
    labelText: "password".tr(),
    hintText: 'pleaseEnterYourPassword'.tr(),
    onSubmitted: (value) {
      cubitLogin.passwordController.text=value;
    },
    controller: cubitLogin.passwordController,
    onChange: (_ ) {  },
  );
}

Widget customTextFormPasswordRegister(context) {
  final cubitRegister = RegisterCubit.get(context);
  return TextFormFieldApp(
    suffixIcon: IconButton(
      onPressed: () {},
      icon: const Icon(
        color: Colors.white,
      Icons.visibility_off ,
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
    obscureText: false,
    labelText: "password".tr(),
    hintText: 'pleaseEnterYourPassword'.tr(),
    onSubmitted: (value) {
      cubitRegister.passwordController.text=value;
    },
    controller:cubitRegister.passwordController,
    onChange: (_ ) {  },
  );
}
