import 'package:flutter/material.dart';

import '../../../../core/resources/app_image.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppImage.logoImage,width: 120,),
        IconButton(onPressed: () {},
          icon: const Icon(Icons.search,size: 32,),),
      ],
    );
  }
}
