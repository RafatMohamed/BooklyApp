import 'package:flutter/material.dart';
import '../../data/book_model/book_model.dart';
import 'details_book.dart';

class DetailsBookAnimation extends StatefulWidget {
  const DetailsBookAnimation({super.key, this.isDetails = false, required this.homeModel});
  final bool isDetails;
  final BookModel homeModel;

  @override
  State<DetailsBookAnimation> createState() => _DetailsBookAnimationState();
}

class _DetailsBookAnimationState extends State<DetailsBookAnimation>
    with TickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isDetails
        ? AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SlideTransition(position: animation, child: child);
          },
          child:BookDetails(isDetails: widget.isDetails,homeModel: widget.homeModel,),
        )
        :  BookDetails(isDetails: widget.isDetails,homeModel: widget.homeModel,);
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticInOut),
    );
    animationController.forward();
  }
}
