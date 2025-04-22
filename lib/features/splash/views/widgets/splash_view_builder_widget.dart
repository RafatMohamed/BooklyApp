import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/helper/my_navigator_app.dart';
import '../../../../core/resources/text_styles.dart';
import '../../../home/data/book_model/book_model.dart';
import '../../../home/views/home_view.dart';

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
            navigatorToPage: () => const HomeView(homeModel:BookModel(),),
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
