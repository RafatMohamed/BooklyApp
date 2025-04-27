import 'dart:io';

class UserModelAuth{
  final String email;
  final String password;
  final File? photoUrl;

  UserModelAuth({required this.email,required this.password, this.photoUrl});
}