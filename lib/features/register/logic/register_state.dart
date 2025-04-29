
import '../../../core/models/auth_user.dart';

class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoading extends RegisterState {}
final class RegisterSuccess extends RegisterState{
  final UserModelAuth userModelAuth;
  RegisterSuccess({required this.userModelAuth});

}
final class RegisterFailure extends RegisterState {
final String error;
RegisterFailure({required this.error});
}
final class LoginChangePasswordVisibility extends RegisterState {
final bool obsecure;
LoginChangePasswordVisibility({required this.obsecure});
}


