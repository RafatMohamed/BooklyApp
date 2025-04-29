import 'package:bookly_app_t/core/helper/notify_app.dart';
import 'package:bookly_app_t/core/models/auth_user.dart';
import 'package:bookly_app_t/features/login/logic/login_cubit.dart';
import 'package:bookly_app_t/features/login/logic/login_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/my_navigator_app.dart';
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
         onPressed: () {
        if(cubitLogin.formKey.currentState!.validate()){
          cubitLogin.formKey.currentState!.save();
          final UserModelAuth user = UserModelAuth(email: cubitLogin.emailController.text, password: cubitLogin.passwordController.text);
          cubitLogin.userLogin(user);
                  }
         },
         text: "loginNow".tr(),
       );
     },
   );
  }

}