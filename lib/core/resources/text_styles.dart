import 'package:flutter/material.dart';
import '../constant/app_constant.dart';

abstract class Styles {
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
      fontFamily: kFontFamilyGSF,
      color: Colors.white70
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.white70
  );
  static const textStyle26 = TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      fontFamily: kFontFamilyGSF,
      color: Colors.white
  );
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    fontFamily: kFontFamilyGSF,
    color: Colors.white
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
      color: Colors.white60
  );
}

const TextStyle textStyle = TextStyle();