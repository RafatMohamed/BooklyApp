import 'package:flutter/material.dart';
import 'custom_image_w.dart';

class AnimationItemCategory extends StatelessWidget{
  const AnimationItemCategory({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        height: MediaQuery.sizeOf(context).height * 1 /3.8,
        width:MediaQuery.sizeOf(context).width * 1 /3 ,
        duration: const Duration(milliseconds: 500),
        transform: isSelected
            ? Matrix4.identity().scaled(1.1)
            : Matrix4.identity(),
        child: isSelected? customImage():Center(child: customImage(),) ,
    );
  }

}