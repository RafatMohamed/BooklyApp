import 'package:bookly_app_t/core/helper/notify_app.dart';
import 'package:bookly_app_t/core/models/auth_user.dart';
import 'package:bookly_app_t/core/resources/app_image.dart';
import 'package:bookly_app_t/features/register/logic/register_cubit.dart';
import 'package:bookly_app_t/features/register/logic/register_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/my_navigator_app.dart';
import '../../../../core/logic/is_login_hive.dart';
import '../../../../core/logic/save_info_person.dart';
import '../../../../core/widget/default_material_button.dart';
import '../../../home/views/home_view.dart';
class BlocConsumerRegister extends StatelessWidget{
  const BlocConsumerRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitRegister= RegisterCubit.get(context);
   return  BlocConsumer<RegisterCubit, RegisterState>(
     listener: (context, state) {
      if(state is RegisterFailure){
         ScaffoldMessenger.of(context).showSnackBar(
           AppNotify.snackBar(widget: Text(state.error), context: context),
        );
      }
      if(state is RegisterSuccess){
        ScaffoldMessenger.of(context).showSnackBar(
          AppNotify.snackBar(widget: Text("Success Register ${state.userModelAuth.email}"), context: context),
        );
        AppNavigator.navigatorPush(
          navigatorToPage:  const HomeView(),
          context: context,
        );
      }
     },
     builder: (context, state) {
       if(state is RegisterLoading){
         return AppNotify.circularProgress(context);
       }
       return DefaultMaterialButton(
         onPressed: () async{
           if(cubitRegister.formKey.currentState!.validate()){
           cubitRegister.formKey.currentState!.save();
           String imagePath = cubitRegister.pickedImagePath ?? AppImage.imageProfile;

           final UserModelAuth user = UserModelAuth(
             email: cubitRegister.emailController.text,
             password: cubitRegister.passwordController.text,
             imageProfile: imagePath,
           );
           cubitRegister.userRegister(user);
           SavedLogin.savedLogin(isLogin: true);
           await SavedInfoPerson.savedInfoPerson(user:user, key: user.email!);
           await SavedInfoPerson.savedInfoPerson(user: user, key: "currentUser");
           }
         },
         text: "registerNow".tr(),
       );
     },
   );
  }

}