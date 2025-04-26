import 'package:bookly_app_t/core/helper/my_navigator_app.dart';
import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:bookly_app_t/core/resources/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widget/custom_logo.dart';
import '../../../core/widget/custom_tf_email.dart';
import '../../../core/widget/custom_tf_password_cubit.dart';
import '../../../core/widget/default_material_button.dart';
import '../../../core/widget/default_text_butt.dart';
import '../../../login/views/login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    final fixedSizeHeight = MediaQuery.of(context).size.height;
    return Builder(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.05,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customLogo(context: context, width: 120),
                    const SizedBox(height: 100),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text("signUp".tr(), style: Styles(context).textStyle26),
                        const SizedBox(height: 10),
                        customTextFormEmailRegister(context),
                        const SizedBox(height: 10),
                        customTextFormPasswordRegister(context),
                      ],
                    ),
                    SizedBox(height: fixedSizeHeight * 0.03),
                    Column(
                      children: [
                        DefaultMaterialButton(
                          onPressed: () {
                            AppNavigator.navigatorPush(
                              navigatorToPage:  const LoginView()
                              , context: context,
                            );
                          },
                          text: "registerNow".tr(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              "alreadyHaveAccount".tr(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                overlayColor:AppColor(context).whiteColor
                              ),
                              onPressed: () {
                                AppNavigator.navigatorPush(
                                  navigatorToPage:  const LoginView(),
                                  context: context,
                                );
                              },
                              child: Text(
                                "loginNow".tr(),
                                style: Styles(context).textStyle18.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
