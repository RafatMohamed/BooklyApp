import 'package:hive_flutter/adapters.dart';
part 'auth_user.g.dart';
@HiveType(typeId: 0)
class UserModelAuth extends HiveObject{
  @HiveField(0)
  final String? email;
  @HiveField(1)
  final String? password;
  @HiveField(2)
  final String? imageProfile;
  UserModelAuth({this.email, this.password,this.imageProfile});
}