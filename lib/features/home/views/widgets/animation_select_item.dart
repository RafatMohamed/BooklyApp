import 'package:flutter/material.dart';
import 'custom_image_w.dart';

class AnimationItemCategory extends StatelessWidget {
  const AnimationItemCategory({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: MediaQuery.sizeOf(context).height * 0.2,
      width: MediaQuery.sizeOf(context).width * 0.3,
      duration: const Duration(milliseconds: 500),
      transform:
          isSelected ? Matrix4.identity().scaled(1.1) : Matrix4.identity(),
      child: isSelected ? customImage() : Center(child: customImage()),
    );
  }
}
