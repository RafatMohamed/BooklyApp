import 'package:bookly_app_t/core/helper/notify_app.dart';
import 'package:bookly_app_t/features/login/logic/reset_pass_cubit/resrt_password_cubit.dart';
import 'package:bookly_app_t/features/login/logic/reset_pass_cubit/resrt_password_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/default_material_button.dart';

class BlocConsumerResetPass extends StatelessWidget{
  const BlocConsumerResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                AppNotify.snackBar(
                  context: context,
                  widget: Text(
                    state.error,
                  ),
                ),
              );
            }
            if (state is ResetPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                AppNotify.snackBar(
                  context: context,
                  widget: Text(
                   "send reset password to ${state.emailAuth}",
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            final resetPassword=ResetPasswordCubit.get(context);
            if(state is ResetPasswordLoading){
              return AppNotify.circularProgress(context);
            }
            return DefaultMaterialButton(
              onPressed: () {
              if(resetPassword.formKey.currentState!.validate()){
                resetPassword.formKey.currentState!.save();
                final emailAuth=resetPassword.resetEmailController.text;
                resetPassword.resetPassword(emailAuth: emailAuth);
              }
              },
              text: "confirm".tr(),
            );
          },
        );
      }
    );
  }

}