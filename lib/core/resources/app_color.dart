import 'package:flutter/material.dart';

abstract class AppColor {
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
  static Color highlightColor =Colors.white.withValues(alpha: 0.3);
}
