import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/my_navigator_app.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/resources/text_styles.dart';
import '../../../register/views/register_view.dart';

Widget dontHaveAccount(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "dontHaveAccount",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ).tr(),
      TextButton(
        style: TextButton.styleFrom(
            overlayColor:AppColor(context).whiteColor
        ),
        onPressed: () {
          AppNavigator.navigatorPush(
            navigatorToPage:  const RegisterView(),
            context: context,
          );
        },
        child: Text(
          "signUp".tr(),
          style: Styles(context).textStyle18.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}