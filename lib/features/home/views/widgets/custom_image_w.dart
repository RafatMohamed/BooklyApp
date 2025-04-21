import 'package:flutter/cupertino.dart';

import '../../../../core/resources/app_image.dart';

Widget customImage({ double height=145}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Image.asset(height: height, AppImage.imageTest, fit: BoxFit.cover),
  );
}
