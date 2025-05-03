import 'package:bookly_app_t/core/resources/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/logic/language_cubit/language_cubit.dart';
import '../../app/logic/language_cubit/language_state.dart';

class DropDownLang extends StatelessWidget {
  const DropDownLang({super.key});

  @override
  Widget build(BuildContext context) {
    // DropdownButtonHideUnderline(
    //      child: DropdownButton<Locale>(
    //        value: context.locale,
    //        alignment: AlignmentDirectional.centerEnd,
    //        borderRadius: BorderRadius.circular(5),
    //        icon: const Icon(Icons.arrow_drop_down),
    //        elevation: 8,
    //        items: const [
    //          DropdownMenuItem(
    //            value: Locale('en'),
    //            child: Text('English'),
    //          ),
    //          DropdownMenuItem(
    //            value: Locale('ar'),
    //            child: Text('العربية'),
    //          ),
    //        ],
    //        onChanged: (value) {
    //          if (value != null) {
    //            context.setLocale(value);
    //            context.read<LanguageCubit>().changeLanguage(value);
    //          }
    //        },
    //      ),
    //    );
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        final cubit = context.read<LanguageCubit>();
        return ToggleButtons(
          borderRadius: BorderRadius.circular(5),
          selectedBorderColor: Colors.green,
            selectedColor:AppColor(context).blackColor,
          constraints: const BoxConstraints(minHeight: 20, minWidth: 20),
          isSelected: [
            context.locale.languageCode == "en",
            context.locale.languageCode == "ar"
          ],
          onPressed: (index) {
            if (index == 0) {
            cubit.changeLanguage(const Locale('en'));
            context.setLocale(const Locale('en'));

            }
            else if (index == 1) {
               cubit.changeLanguage(const Locale('ar'));
               context.setLocale(const Locale('ar'));
            }
          },
          children: [
            SizedBox(width: 60,height: 20,child: Text("English".tr(),textAlign: TextAlign.center,),),
            SizedBox(width: 60,height: 20,child: Text("العربية".tr(),textAlign: TextAlign.center,),),
          ],
        );
      },
    );
  }

}