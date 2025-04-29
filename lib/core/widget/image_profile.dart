import 'dart:io';

import 'package:flutter/material.dart';

import '../resources/app_image.dart';

abstract class CustomImagePerson {
  static Widget imageProfile({required String? image, double size = 100}) {
    if (image != null && image.isNotEmpty && File(image).existsSync()) {
      return ClipOval(
        child: Image.file(
          File(image),
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return ClipOval(
        child: Image.asset(
          AppImage.imageProfile,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}
