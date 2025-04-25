import 'package:flutter/material.dart';
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
   bool isBack =false;
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
      child: Text("Read Free Books", style: Styles(context).textStyle18),
    );
  }

  void goToHome() {
    if(isBack) return;
    isBack=true;
    Future.delayed(const Duration(seconds: 2), () {
      return Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const HomeView(homeModel: BookModel());
          },
        ),
      );
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
