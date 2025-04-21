import 'package:flutter/cupertino.dart';

import '../../../../core/widget/default_text_butt.dart';

class CustomTextButt extends StatelessWidget{
  const CustomTextButt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefaultTextButton(
          text: "500 E£",
          isButton: false,
        )  ,
        DefaultTextButton(
          text: "Free Preview",
          isButton: true,
        )
      ],
    );
  }

}