import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'default_text_form_field_app.dart';

Widget customTextFormEmailLogin(context) {
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
    onSubmitted: (value) {
    },
    controller:TextEditingController(),
    onChange: (String ) {  },
  );
}

Widget customTextFormEmailRegister(context) {
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
    onSubmitted: (_) {},
    controller:TextEditingController(),
    onChange: (String ) {  },
  );
}
