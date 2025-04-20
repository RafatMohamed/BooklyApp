import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_constant.dart';

abstract class AppNavigator {
  static void navigatorPush({
    required BuildContext context,
    required Widget navigatorToPage,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return navigatorToPage;
        },
      ),
    );
  }

  static void navigatorPop({required BuildContext context}) {
    return Navigator.pop(context);
  }

  static Future<T?> navigatorPushGo<T>({
    required BuildContext context,
    required Widget navigatorToPage,
    Transition transition=Transition.fadeIn,
  }) async {
    return Get.to<T>(
          () => navigatorToPage,
      duration:  kTranstionDuration,
      transition: transition,
    );
  }
}
