import 'package:bookly_app_t/core/helper/my_navigator_app.dart';
import 'package:bookly_app_t/features/register/views/test.dart';
import 'package:bookly_app_t/features/register/views/widget/bloc_consumer_register.dart';
import 'package:bookly_app_t/features/register/views/widget/coulmn_textform_w.dart';
import 'package:bookly_app_t/features/register/views/widget/dont_have_account.dart';
import 'package:bookly_app_t/features/register/views/widget/upload_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/resources/app_color.dart';
import '../../../core/resources/app_padding.dart';
import '../../../core/widget/custom_logo.dart';
import '../logic/register_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    final fixedSizeHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomCenter,
                  colors: [
                    AppColor(context).whiteColor ,
                    AppColor(context).highlightColor,
                    AppColor(context).blackColor,
                  ]
                )
              ),
              child: Center(
                child: Padding(
                  padding: AppPadding.hMLR(context: context),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customLogo(context: context, width: 120),
                        const SizedBox(height: 100),
                        const TextFormColumReg(),
                        SizedBox(height: fixedSizeHeight * 0.03),
                        Column(
                          children: [
                            const BlocConsumerRegister(),
                            alreadyHaveAccount(context),
                            const SizedBox(height: 20),
                            const PickImageScreen(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.g_mobiledata_rounded),
                                  color: Colors.red,
                                  iconSize: 50,
                                  onPressed: () async {
                                    try {
                                      // بدء عملية تسجيل الدخول باستخدام Google
                                      final GoogleSignInAccount? googleUser =
                                          await GoogleSignIn().signIn();

                                      if (googleUser == null) {
                                        print('Login aborted by user.');
                                        return; // إذا قام المستخدم بإلغاء العملية
                                      }

                                      // الحصول على بيانات المصادقة
                                      final GoogleSignInAuthentication
                                      googleAuth =
                                          await googleUser.authentication;

                                      // التحقق من الحصول على الـ token
                                      if (googleAuth.accessToken == null ||
                                          googleAuth.idToken == null) {
                                        print(
                                          'Failed to get Google authentication tokens.',
                                        );
                                        return;
                                      }

                                      // استخدام الـ tokens لإنشاء Credential
                                      final credential =
                                          GoogleAuthProvider.credential(
                                            accessToken: googleAuth.accessToken,
                                            idToken: googleAuth.idToken,
                                          );

                                      // تسجيل الدخول باستخدام الـ credential
                                      UserCredential userCredential =
                                          await FirebaseAuth.instance
                                              .signInWithCredential(credential);

                                      if (userCredential.user != null) {
                                        print(

                                          'Google Sign-In successful! Welcome, ${userCredential.user!.displayName}',

                                        );
                                        if(context.mounted){
                                          return AppNavigator.navigatorPush(context: context,
                                              navigatorToPage: TestttView(text:userCredential.user!.displayName,)
                                          );
                                        }
                                      } else {
                                        print('Google Sign-In failed.');
                                      }
                                    } catch (e) {
                                      print('Error during Google Sign-In: $e');
                                    }

                                  },
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
            ),
          );
        },
      ),
    );
  }
}
