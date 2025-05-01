import 'package:bookly_app_t/core/models/auth_user.dart';
import 'package:hive_flutter/adapters.dart';

import '../constant/app_constant.dart';

abstract class SavedInfoPerson {
  static Future<void> savedInfoPerson({required UserModelAuth user,required String key}) async {
    var box = await Hive.openBox<UserModelAuth>(kUserInfo);
    return box.put(key,UserModelAuth(
        email:user.email  , password: user.password, imageProfile: user.imageProfile
    ),
    );
  }
  static Future<UserModelAuth?> getInfoPerson({required String key}) async {
    var box = await Hive.openBox<UserModelAuth>(kUserInfo);
    return box.get(key);
  }
}