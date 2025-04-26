import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/app_color.dart';

class ButtonForgetPass  extends StatelessWidget {
  const ButtonForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
   return Align(
     alignment: AlignmentDirectional.centerEnd,
     child: TextButton(
       style: TextButton.styleFrom(
         foregroundColor: AppColor(context).whiteColor,
         elevation: 0,
         textStyle: const TextStyle(
           fontSize: 13,
           decoration: TextDecoration.underline,
           leadingDistribution:
           TextLeadingDistribution.even,
           textBaseline: TextBaseline.alphabetic,
         ),
       ),
       onPressed: () {},
       child: const Text("forgetPassword").tr(),
     ),
   );
  }

}