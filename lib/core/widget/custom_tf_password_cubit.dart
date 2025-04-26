import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'default_text_form_field_app.dart';

Widget customTextFormPasswordLogin(context) {
  return  TextFormFieldApp(
    suffixIcon: IconButton(
      onPressed: () {},
      icon: Icon(
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
    onSubmitted: (value) {},
    controller: TextEditingController(), onChange: (String ) {  },
  );;
}

Widget customTextFormPasswordRegister(context) {
  return TextFormFieldApp(
    suffixIcon: IconButton(
      onPressed: () {},
      icon: Icon(
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
    onSubmitted: (value) {},
    controller:TextEditingController(), onChange: (String ) {  },
  );
}
