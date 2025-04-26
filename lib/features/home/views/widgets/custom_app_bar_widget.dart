import 'package:bookly_app_t/app/logic/language_cubit/language_cubit.dart';
import 'package:bookly_app_t/app/logic/them_toggle_cubit.dart';
import 'package:bookly_app_t/app/logic/them_toggle_state.dart';
import 'package:bookly_app_t/core/helper/my_navigator_app.dart';
import 'package:bookly_app_t/core/widget/custom_logo.dart';
import 'package:bookly_app_t/features/search/views/search_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/resources/app_image.dart';

class CustomAppBarWidget extends StatefulWidget {
  const CustomAppBarWidget({super.key});

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  Locale currentLocale = const Locale("en");
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           customLogo(context: context, width: 120),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    AppNavigator.navigatorPush(context:   context,
                      navigatorToPage:  const SearchView(),
                    );
                  },
                  icon: const Icon(Icons.search_sharp, size: 32),
                ),
                DropdownButton<Locale>(
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
                ),
                BlocBuilder<ThemToggleCubit, ThemToggleState>(
                  builder: (context, state) {
                    final cubit = context.read<ThemToggleCubit>();
                    return IconButton(
                      onPressed: () {
                        cubit.toggleTheme();
                      },
                      icon: Icon(
                        cubit.isDark
                            ? Icons.toggle_on_outlined
                            : Icons.toggle_off_outlined,
                        size: 32,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
