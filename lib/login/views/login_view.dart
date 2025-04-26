import 'package:bookly_app_t/features/home/data/book_model/book_model.dart';
import 'package:bookly_app_t/features/home/views/home_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/custom_tf_email.dart';
import '../../../core/widget/custom_tf_password_cubit.dart';
import '../../../core/widget/default_material_button.dart';
import '../../../core/widget/default_text_butt.dart';
import '../../core/helper/my_navigator_app.dart';
import '../../core/resources/app_color.dart';
import '../../core/resources/text_styles.dart';
import '../../core/widget/custom_logo.dart';
import '../../features/register/views/register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
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
                      children: [
                        Text(
                          "signIn".tr(),
                            style: Styles(context).textStyle26),
                        const SizedBox(height: 10),
                        customTextFormEmailLogin(context),
                        const SizedBox(height: 10),
                        customTextFormPasswordLogin(context),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
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
                        ),
                      ],
                    ),
                    SizedBox(height: fixedSizeHeight * 0.03),
                    Column(
                      children: [
                        DefaultMaterialButton(
                          onPressed: () {
                            AppNavigator.navigatorPush(
                              navigatorToPage:  const HomeView(homeModel: BookModel()
                            ),
                            context: context,
                            );
                          },
                          text: "loginNow".tr(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "dontHaveAccount",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ).tr(),
                            TextButton(
                              style: TextButton.styleFrom(
                                  overlayColor:AppColor(context).whiteColor
                              ),
                              onPressed: () {
                                AppNavigator.navigatorPush(
                                  navigatorToPage:  const RegisterView(),
                                  context: context,
                                );
                              },
                              child: Text(
                                "registerNow".tr(),
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
