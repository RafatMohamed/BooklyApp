import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/text_styles.dart';
import '../../../../core/widget/custom_tf_email.dart';
import '../../../../core/widget/custom_tf_password_cubit.dart';

class TextFormColumReg extends StatelessWidget {
  const TextFormColumReg({super.key});

 @override
  Widget build(BuildContext context) {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     spacing: 10,
     children: [
       Text("signUp".tr(), style: Styles(context).textStyle26),
       const SizedBox(height: 10),
       customTextFormEmailRegister(context),
       const SizedBox(height: 10),
       customTextFormPasswordRegister(context),
     ],
   );
  }
}