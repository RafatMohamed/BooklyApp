import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/text_styles.dart';
import '../../../../core/widget/custom_tf_email.dart';
import '../../../../core/widget/custom_tf_password_cubit.dart';
import 'custom_button_forget_pass.dart';

class TextFormColum extends StatelessWidget {
  const TextFormColum({super.key});

 @override
  Widget build(BuildContext context) {
   return   Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Text(
           "signIn".tr(),
           style: Styles(context).textStyle26),
       const SizedBox(height: 10),
       customTextFormEmailLogin(context),
       const SizedBox(height: 10),
       customTextFormPasswordLogin(context),
       const ButtonForgetPass(),
     ],
   );
  }
}