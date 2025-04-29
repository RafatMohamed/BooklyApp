import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/text_styles.dart';
import '../../on_boarding/views/on_boarding_view.dart';

class SplashViewWidget extends StatefulWidget {
  const SplashViewWidget({super.key});

  @override
  State<SplashViewWidget> createState() => _SplashViewWidgetState();
}

class _SplashViewWidgetState extends State<SplashViewWidget>
    with TickerProviderStateMixin {
  bool isBack = false;
  late AnimationController animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    initAnimation();
    goToOnBoarding(context);
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
      child: Text("readFreeBooks".tr(),
          style: Styles(context).textStyle18),
    );
  }

  void goToOnBoarding(context) {
    if (isBack) return;
    isBack = true;
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        return Navigator.of( context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const OnBoardingView();
            },
          ),
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
