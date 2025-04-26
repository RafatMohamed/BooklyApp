import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:bookly_app_t/core/resources/text_styles.dart';
import 'package:flutter/material.dart';

class DefaultMaterialButton extends StatelessWidget {
  const DefaultMaterialButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      onPressed: onPressed,
      elevation:5,
      color: AppColor(context).whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(style: BorderStyle.solid,color: AppColor(context).blackColor,width: 0.2)),
      child: Text(
        text,
        style: Styles(context).textStyle20.copyWith(color: AppColor(context).blackColor),
      ),
    );
  }
}
