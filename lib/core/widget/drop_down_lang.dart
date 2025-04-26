import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/logic/language_cubit/language_cubit.dart';

class DropDownLang  extends StatelessWidget{
  const DropDownLang({super.key});

  @override
  Widget build(BuildContext context) {
   return DropdownButton<Locale>(
     value: context.locale, // Get the current locale
     items: const [
       DropdownMenuItem(
         value: Locale('en'),
         child: Text('English'),
       ),
       DropdownMenuItem(
         value: Locale('ar'),
         child: Text('العربية'),
       ),
     ],
     onChanged: (value) {
       if (value != null) {
         context.setLocale(value);
         context.read<LanguageCubit>().changeLanguage(value);
       }
     },
   );
  }

}