import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/my_navigator_app.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/resources/text_styles.dart';
import '../../../login/views/login_view.dart';

Widget alreadyHaveAccount(context) {
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "alreadyHaveAccount".tr(),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      TextButton(
        style: TextButton.styleFrom(
            overlayColor:AppColor(context).whiteColor
        ),
        onPressed: () {
          AppNavigator.navigatorPush(
            navigatorToPage:  const LoginView(),
            context: context,
          );
        },
        child: Text(
          "loginNow".tr(),
          style: Styles(context).textStyle18.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}