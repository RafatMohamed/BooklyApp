import 'package:bookly_app_t/core/constant/app_constant.dart';
import 'package:hive_flutter/adapters.dart';

abstract class SavedLogin{
  static Future<void> savedLogin({required bool isLogin}) async {
    var box = await Hive.openBox(kUserLogin);
    box.put('isLogin', isLogin);
  }
}