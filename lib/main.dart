import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'app/my_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constant/app_constant.dart';
import 'core/observe_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Bloc.observer = DefaultObserve();
  await Hive.openBox(kOpenBoxSettingThem);
  Bloc.observer=DefaultObserve();

  runApp(const BookApp());
}


