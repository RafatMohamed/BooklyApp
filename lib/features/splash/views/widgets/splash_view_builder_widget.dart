import 'package:bookly_app/core/helper/my_navigator_app.dart';
import 'package:bookly_app/features/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/text_styles.dart';

class SplashViewWidget extends StatefulWidget {
  const SplashViewWidget({super.key});

  @override
  State<SplashViewWidget> createState() => _SplashViewWidgetState();
}

class _SplashViewWidgetState extends State<SplashViewWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    initAnimation();
    goToHome();
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SlideTransition(position: animation, child: child);
      },
      child: const Text("Read Free Books", style: Styles.textStyle18),
    );

  }
  void goToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        return AppNavigator.navigatorPushGo(
            navigatorToPage: () => const HomeView(),
            transition: Transition.topLevel
        );
      }
    });
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<Offset>(
      begin: const Offset(0, 20),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticInOut),
    );
    animationController.forward();
  }
}
