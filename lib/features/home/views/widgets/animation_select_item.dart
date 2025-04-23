import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:flutter/material.dart';
import '../../data/book_model/book_model.dart';
import 'custom_image_w.dart';

class AnimationItemCategory extends StatelessWidget {
  const AnimationItemCategory({super.key, required this.isSelected, required this.homeModel});
  final bool isSelected;
  final BookModel homeModel;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [AppColor(context).whiteColor.withValues(alpha:0.7) ,
          AppColor(context).blackColor.withValues(alpha:0.7)]),
      ),
      height: MediaQuery.sizeOf(context).height * 0.2,
      width: MediaQuery.sizeOf(context).width * 0.3,
      duration: const Duration(milliseconds: 500),
      transform:
          isSelected ? Matrix4.identity().scaled(1.1) : Matrix4.identity(),
      child: isSelected ? customImageFuture(width:100,homeModel: homeModel) : Center(child: customImageFuture(width:100,homeModel: homeModel)),
    );
  }
}
