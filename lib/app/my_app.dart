import 'package:bookly_app_t/app/logic/language_cubit/language_cubit.dart';
import 'package:bookly_app_t/app/logic/them_toggle_cubit.dart';
import 'package:bookly_app_t/app/logic/them_toggle_state.dart';
import 'package:bookly_app_t/features/home/model/home_future_cubit/home_fetch_book_cubit.dart';
import 'package:bookly_app_t/features/search/model/search_cubit/search_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/constant/app_constant.dart';
import '../features/home/model/home_cubit/home_fetch_book_cubit.dart';
import '../features/splash/views/splash_view.dart';

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemToggleCubit()),
        BlocProvider(create: (context) => HomeFetchNewestBookCubit()..getBooks()),
        BlocProvider(create: (context) => HomeFetchFutureBookCubit()..getBooks()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => LanguageCubit()), // Ensure this line is correct
      ],
      child: BlocBuilder<ThemToggleCubit, ThemToggleState>(
        builder: (context, state) {
          final cubit = context.read<ThemToggleCubit>();
          if (state is ThemToggleSuccess) {
            cubit.isDark = state.isDark;
          }
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: kAppTitle,
            theme: cubit.isDark
                ? ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
              textTheme: ThemeData.dark().textTheme.apply(
                fontFamily: kFontFamilyMA,
              ),
            )
                : ThemeData.light().copyWith(
              scaffoldBackgroundColor: Colors.white,
              textTheme: ThemeData.light().textTheme.apply(
                fontFamily: kFontFamilyMA,
              ),
            ),
            home:const SplashView()
          );
        },
      ),
    );
  }
}
