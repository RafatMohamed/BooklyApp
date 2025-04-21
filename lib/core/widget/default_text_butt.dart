import 'package:bookly_app_t/core/constant/app_constant.dart';
import 'package:bookly_app_t/core/resources/text_styles.dart';
import 'package:flutter/material.dart';

import '../resources/app_radius.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({
    super.key,
    required this.text,  this.isButton=true,

  });
  final String text;
  final  bool isButton;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isButton ? Colors.deepOrangeAccent:Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(
                 bottomEnd : isButton ? AppRadius.rC16 : Radius.circular(0) ,
                  topEnd:isButton ? AppRadius.rC16 : Radius.circular(0) ,
                  topStart: isButton ?  Radius.circular(0): AppRadius.rC16 ,
                  bottomStart: isButton ?  Radius.circular(0): AppRadius.rC16 ,
                )
            )
        ),
        onPressed: (){},
        child: Text(text, style:isButton? Styles.textStyle18.copyWith(fontFamily: kFontFamilyGSF): Styles.textStyle18.copyWith(color: Colors.black54),),
      ),
    );
  }
}
