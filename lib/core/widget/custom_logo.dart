import 'package:flutter/material.dart';

import '../resources/app_color.dart';
import '../resources/app_image.dart';

Widget customLogo({required BuildContext context , double width=120}) {
  return Image.asset(AppImage.logoImage,color: AppColor(context).whiteColor,width: width,
  );
}
