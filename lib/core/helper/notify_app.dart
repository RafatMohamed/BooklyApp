import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppNotify {
  static SnackBar snackBar({
    required Widget widget,
    required BuildContext context,
  }) => SnackBar(
    dismissDirection: DismissDirection.startToEnd,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    shape: BeveledRectangleBorder(
      side: BorderSide(color: AppColor(context).blackColor, width: 1.5),
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 2),
    backgroundColor: AppColor(context).whiteColor,
    content: widget,
  );

  static Widget circularProgress(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.black,
        color:AppColor(context).whiteColor,
      ),
    );
  }
}
