import 'package:bookly_app_t/core/helper/notify_app.dart';
import 'package:bookly_app_t/features/login/views/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../app/logic/them_toggle_cubit.dart';
import '../../../core/constant/app_constant.dart';
import '../../../core/helper/my_navigator_app.dart';
import '../../../core/logic/save_info_person.dart';
import '../../../core/models/auth_user.dart';
import '../../../core/resources/app_color.dart';
import '../../../core/resources/text_styles.dart';
import '../../../core/widget/bloc_builder_them.dart';
import '../../../core/widget/drop_down_lang.dart';
import '../../../core/widget/image_profile.dart';

class PersonView extends StatefulWidget {
  const PersonView({super.key});

  @override
  State<PersonView> createState() => _PersonViewState();
}

class _PersonViewState extends State<PersonView> {
  UserModelAuth? user;
  @override
  void initState() {
    pickImage();
    super.initState();
  }

  Future<void> pickImage() async {
    UserModelAuth? currentUser = await SavedInfoPerson.getInfoPerson(key: "currentUser");
    setState(() {
      user = currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemToggleCubit>();
    return Scaffold(
      body:user == null ?
     AppNotify.circularProgress(context)
          : Container(
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
          padding: const EdgeInsetsDirectional.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      AppNavigator.navigatorPop(context: context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_rounded, size: 18),
                  ),
                  const SizedBox(width: 10),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text("welcome".tr(), style: Styles(context).textStyle30),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    CustomImagePerson.imageProfile(image: user!.imageProfile,),
                    const SizedBox(height: 20),
                    Text(
                      (user!.email ?? "UnKnown".tr()).split('@')[0],
                      style: Styles(context).textStyle26,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Divider(
                endIndent: 40,
                color: AppColor(context).whiteColor.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.settings,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "settings".tr(),
                    style: Styles(context).textStyle26,
                  ).tr(),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                       cubit.isDark ? Icons.dark_mode : Icons.light_mode,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "theme".tr(),
                        style: Styles(context).textStyle20,
                      ).tr(),
                    ],
                  ),

                  const ThemToggleBuilder(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.language,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "language".tr(),
                        style: Styles(context).textStyle20,
                      ).tr(),
                    ],
                  ),
                  const DropDownLang(),
                ],
              ),
              Divider(
                endIndent: 40,
                color: AppColor(context).whiteColor.withValues(alpha: 0.5),
              ),
              TextButton(
                onPressed: () async {
                  logout(context: context);
                },
                child:
                    Row(
                      children: [
                        const Icon(
                          Icons.logout,
                          color: Colors.redAccent,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "logout".tr(),
                          style: Styles(context).textStyle26.copyWith(
                            color: Colors.redAccent.shade200.withValues(alpha: 0.7),
                          ),
                        ).tr(),
                      ],
                    ),
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
   if(context.mounted){
     await Navigator.pushReplacement(
       context,
       MaterialPageRoute(builder: (context) => const LoginView()),
     );
   }
  }
}
