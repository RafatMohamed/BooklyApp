import 'package:bookly_app_t/core/models/auth_user.dart';

class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {
  final UserModelAuth userModelAuth;
  LoginSuccess({required this.userModelAuth});
}
final class LoginFailure extends LoginState {
 final String error;
 LoginFailure({required this.error});
}
