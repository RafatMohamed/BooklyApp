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

  static void navigatorPushGo({
    required Widget Function() navigatorToPage,
    Transition transition = Transition.fadeIn,
    Duration duration = kTranstionDuration,
  }) {
    Get.to(
      navigatorToPage,
      transition: transition,
      duration: duration,
    );
  }
}
