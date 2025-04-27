import 'package:bookly_app_t/core/resources/app_padding.dart';
import 'package:bookly_app_t/features/login/logic/reset_pass_cubit/resrt_password_cubit.dart';
import 'package:bookly_app_t/features/login/views/widget/bloc_consumer_reset_pass.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/resources/app_color.dart';
import '../../../core/widget/default_text_form_field_app.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Builder(
        builder: (context) {
          final resetCubit = ResetPasswordCubit.get(context);
          return Scaffold(
            body: Form(
              key: resetCubit.formKey,
              child: SafeArea(
                child: Padding(
                  padding: AppPadding.hMLR(context: context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormFieldApp(
                        suffixIcon:  Icon(Icons.email, color: AppColor(context).whiteColor),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your valid email";
                          } else if (!value.contains("@")) {
                            return "Please enter a valid email";
                          } else if (value !=
                              resetCubit.resetEmailController.text) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        labelText: "email".tr(),
                        hintText: 'pleaseEnterYourEmail'.tr(),
                        onSubmitted: (email) {
                          resetCubit.resetEmailController.text = email;
                        },
                        controller: resetCubit.resetEmailController,
                        onChange: (_) {},
                      ),
                      const SizedBox(height: 50),
                      const BlocConsumerResetPass(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
