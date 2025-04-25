import 'dart:ui';

import 'package:flutter/material.dart';

import '../constant/app_constant.dart';
import 'app_color.dart';

class Styles {
  final BuildContext context;
  final AppColor appColor;

  Styles(this.context) : appColor = AppColor(context);

  TextStyle get textStyle18 => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: appColor.whiteColor.withOpacity(0.7),
  );

  TextStyle get textStyle20 => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: appColor.whiteColor.withValues(alpha: 0.7),
  );

  TextStyle get textStyle26 => TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: appColor.whiteColor,
  );

  TextStyle get textStyle30 => TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    fontFamily: kFontFamilyGSF,
    color: appColor.whiteColor,
  );

  TextStyle get textStyle14 => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: appColor.whiteColor,
  );

  TextStyle get textStyle16 => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: appColor.whiteColor.withOpacity(0.6),
  );
}
