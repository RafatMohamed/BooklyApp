import 'package:bookly_app_t/core/resources/app_padding.dart';
import 'package:bookly_app_t/features/home/data/book_model/book_model.dart';
import 'package:bookly_app_t/features/home/views/home_view.dart';
import 'package:bookly_app_t/features/login/views/widget/coulmn_textform_w.dart';
import 'package:bookly_app_t/features/login/views/widget/dont_have_account.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/helper/my_navigator_app.dart';
import '../../../core/widget/custom_logo.dart';
import '../../../core/widget/default_material_button.dart';

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
              padding: AppPadding.hMLR(context: context),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customLogo(context: context,),
                    const SizedBox(height: 100),
                    const TextFormColum(),
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
                        dontHaveAccount(context),
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
