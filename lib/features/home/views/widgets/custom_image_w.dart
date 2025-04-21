import 'package:flutter/cupertino.dart';

import '../../../../core/resources/app_image.dart';
Widget customImage(){
  return ClipRRect(
    borderRadius: BorderRadius.circular(24),
    child: Image.asset(
      AppImage.imageTest,
      fit: BoxFit.cover,
    ),
  );
}