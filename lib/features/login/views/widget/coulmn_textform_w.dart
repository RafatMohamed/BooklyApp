import 'package:bookly_app_t/features/login/logic/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/text_styles.dart';
import '../../../../core/widget/custom_tf_email.dart';
import '../../../../core/widget/custom_tf_password_cubit.dart';
import '../../logic/reset_pass_cubit/resrt_password_cubit.dart';
import 'custom_button_forget_pass.dart';

class TextFormColum extends StatelessWidget {
  const TextFormColum({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginCubit.get(context).formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "signIn".tr(),
              style: Styles(context).textStyle26
          ),
          const SizedBox(height: 10),
          customTextFormEmailLogin(context),
          const SizedBox(height: 10),
          customTextFormPasswordLogin(context),
          const  ButtonForgetPass(),
        ],
      ),
    );
  }
}