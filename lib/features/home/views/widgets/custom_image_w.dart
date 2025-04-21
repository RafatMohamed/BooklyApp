import 'package:flutter/cupertino.dart';

import '../../../../core/resources/app_image.dart';

Widget customImage() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Image.asset(height: 145, AppImage.imageTest, fit: BoxFit.cover),
  );
}
