import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constant/app_constant.dart';
import '../features/splash/views/splash_view.dart';

class BookApp extends StatelessWidget {
  const BookApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: kAppTitle,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme:ThemeData.dark().textTheme.apply(
          fontFamily: kFontFamilyMA
        ),
      ),
      home: const SplashView(),
    );
  }
}
