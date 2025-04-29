import 'package:bookly_app_t/core/models/auth_user.dart';
import 'package:hive_flutter/adapters.dart';

import '../constant/app_constant.dart';

abstract class SavedInfoPerson {
  static Future<void> savedInfoPerson({required UserModelAuth user}) async {
    var box = await Hive.openBox<UserModelAuth>(kUserInfo);
    box.put('currentUser',UserModelAuth(
        email:user.email  , password: user.password, imageProfile: user.imageProfile
    ),
    );
  }
}