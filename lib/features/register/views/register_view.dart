import 'package:bookly_app_t/features/register/views/widget/bloc_consumer_register.dart';
import 'package:bookly_app_t/features/register/views/widget/coulmn_textform_w.dart';
import 'package:bookly_app_t/features/register/views/widget/dont_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          body: Center(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon:const Icon(Icons.facebook)
                        , color: Colors.red,
                      onPressed: () {
                        // هنا تحط كود تسجيل الدخول بـ Google
                        print('Google icon pressed');
                      },
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(Icons.facebook),
                      color: Colors.blue,
                      onPressed: () {
                        // هنا تحط كود تسجيل الدخول بـ Facebook
                        print('Facebook icon pressed');
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
        );
      },
    ),
);
  }
}
