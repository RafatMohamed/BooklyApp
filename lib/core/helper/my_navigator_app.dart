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
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => navigatorToPage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Slide from bottom
          const beginOffset = Offset(0.0, 1.0);
          const endOffset = Offset.zero;
          final offsetTween = Tween(begin: beginOffset, end: endOffset);

          final opacityTween = Tween<double>(begin: 0.0, end: 1.0);

          return SlideTransition(
            position: animation.drive(offsetTween),
            child: FadeTransition(
              opacity: animation.drive(opacityTween),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }


  static void navigatorPop({required BuildContext context}) {
    return Navigator.pop(context);
  }

}
