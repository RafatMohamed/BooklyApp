import 'package:flutter/material.dart';

class AppColor {
  final BuildContext context;
  AppColor(this.context);

  Color get whiteColor =>
      Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black;

  Color get blackColor =>
      Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white;

  Color get highlightColor =>
      Theme.of(context).brightness == Brightness.dark
          ? Colors.white.withValues(alpha: 0.1)
          : Colors.black.withValues(alpha: 0.1);
}
