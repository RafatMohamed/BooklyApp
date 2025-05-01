import 'package:bookly_app_t/app/logic/language_cubit/language_cubit.dart';
import 'package:bookly_app_t/core/models/auth_user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:bookly_app_t/app/my_app.dart';
import 'app/logic/language_cubit/language_state.dart';
import 'core/constant/app_constant.dart';
import 'core/observe_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();


// ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAuthAdapter());
  await Hive.openBox(kOpenBoxSettingThem);
  await Hive.openBox(kUserLogin);
  await Hive.openBox<UserModelAuth>(kUserInfo);


  final directory = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(directory.path),
  );

final savedLanguage=LanguageCubit();
Locale startLocale=const Locale("en");

if(savedLanguage.state is LanguageChanged)
{
  startLocale=(savedLanguage.state as LanguageChanged).locale;
}



  Bloc.observer = DefaultObserve();

  runApp(
     EasyLocalization(
         supportedLocales: const [Locale('en'), Locale('ar')],
         path: 'assets/translation',
         fallbackLocale: const Locale('en'),
         startLocale: startLocale,
         child:const  BookApp()),
  );
}
