import 'dart:io';

import 'package:bookly_app_t/core/helper/my_navigator_app.dart';
import 'package:bookly_app_t/features/login/views/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../core/constant/app_constant.dart';
import '../../../core/resources/app_color.dart';
import '../../../core/resources/app_image.dart';
import '../../../core/resources/app_padding.dart';
import '../../../core/resources/text_styles.dart';

class PersonView extends StatelessWidget {
  const PersonView({super.key, required this.profileImage});
  final String profileImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsetsDirectional.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: AlignmentDirectional.topStart,
            begin: AlignmentDirectional.bottomEnd,
            colors: [
              AppColor(context).whiteColor.withValues(alpha: 0.7),
              AppColor(context).blackColor.withValues(alpha: 0.7),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(top: 75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text("welcome".tr(), style: Styles(context).textStyle30),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.file(
                        File(profileImage),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("name", style: Styles(context).textStyle26),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Divider(
                indent: 40,
                color: AppColor(context).whiteColor.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () async {
                  logout(context: context);
                },
                child:
                    Text(
                      "logout".tr(),
                      style: Styles(context).textStyle30.copyWith(
                        color: Colors.redAccent.shade200.withValues(alpha: 0.7),
                      ),
                    ).tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout({required BuildContext context}) async {
    var box = await Hive.openBox(kUserLogin);
    box.put('isLogin', false);
    if (context.mounted) {
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginView(),));
    }
  }
}
