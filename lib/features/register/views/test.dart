import 'package:flutter/material.dart';

class TestttView extends StatelessWidget{
  const TestttView({super.key, required this.text});
 final String? text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(text??"",style: const TextStyle(fontSize: 50),),
      ),
    );
  }

}