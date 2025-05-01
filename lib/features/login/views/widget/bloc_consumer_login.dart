import 'package:bookly_app_t/core/helper/notify_app.dart';
import 'package:bookly_app_t/core/logic/is_login_hive.dart';
import 'package:bookly_app_t/core/models/auth_user.dart';
import 'package:bookly_app_t/features/login/logic/login_cubit.dart';
import 'package:bookly_app_t/features/login/logic/login_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/helper/my_navigator_app.dart';
import '../../../../core/logic/save_info_person.dart';
import '../../../../core/widget/default_material_button.dart';
import '../../../home/views/home_view.dart';

class BlocConsumerLogin extends StatelessWidget{
  const BlocConsumerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitLogin= LoginCubit.get(context);
   return  BlocConsumer<LoginCubit, LoginState>(
     listener: (context, state) {
      if(state is LoginFailure){
         ScaffoldMessenger.of(context).showSnackBar(
           AppNotify.snackBar(widget: Text(state.error), context: context),
        );
      }
      if(state is LoginSuccess){
        ScaffoldMessenger.of(context).showSnackBar(
          AppNotify.snackBar(widget: Text("Success login ${state.userModelAuth.email}"), context: context),
        );
        AppNavigator.navigatorPush(
          navigatorToPage:  const HomeView(),
          context: context,
        );
      }
     },
     builder: (context, state) {
       if(state is LoginLoading){
         return AppNotify.circularProgress(context);
       }
       return DefaultMaterialButton(
         onPressed: () async{
           var _ = await Hive.openBox<UserModelAuth>(kUserInfo);
           final UserModelAuth user = UserModelAuth(email: cubitLogin.emailController.text, password: cubitLogin.passwordController.text,);
           if(cubitLogin.formKey.currentState!.validate()){
             cubitLogin.formKey.currentState!.save();
             UserModelAuth? existingUser = await SavedInfoPerson.getInfoPerson(key: user.email!);
             if (existingUser != null && existingUser.password == user.password) {
               cubitLogin.userLogin(existingUser);
               SavedLogin.savedLogin(isLogin: true);
               await SavedInfoPerson.savedInfoPerson(user: existingUser, key: "currentUser");
             }
           }
         },
         text: "loginNow".tr(),
       );
     },
   );
  }

}