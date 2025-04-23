import 'package:bookly_app_t/core/constant/app_constant.dart';
import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:bookly_app_t/core/resources/text_styles.dart';
import 'package:flutter/material.dart';

import '../resources/app_radius.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({
    super.key,
    required this.text,  this.isButton=true, required this.onPressed,

  });
  final String text;
  final  bool isButton;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isButton ? Colors.deepOrangeAccent:AppColor(context).whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(
                 bottomEnd : isButton ? AppRadius.rC16 : const Radius.circular(0) ,
                  topEnd:isButton ? AppRadius.rC16 : const Radius.circular(0) ,
                  topStart: isButton ?  const Radius.circular(0): AppRadius.rC16 ,
                  bottomStart: isButton ?  const Radius.circular(0): AppRadius.rC16 ,
                )
            )
        ),
        onPressed: onPressed,
        child: Text(text, style:isButton? Styles(context).textStyle18.copyWith(fontFamily: kFontFamilyGSF): Styles(context).textStyle18.copyWith(color:AppColor(context).blackColor),),
      ),
    );
  }
}
