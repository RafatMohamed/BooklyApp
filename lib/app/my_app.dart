import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/app_constant.dart';
import '../main.dart';

class BookApp extends StatelessWidget {
  const BookApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: kAppTitle,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark
      ),
      home: const MyHomePage(),
    );
  }
}
