import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constant/app_constant.dart';
import '../main.dart';

class BookApp extends StatelessWidget {
  const BookApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      home: const MyHomePage(),
    );
  }
}
