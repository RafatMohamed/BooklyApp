sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}
final class ResetPasswordLoading extends ResetPasswordState {}
final class ResetPasswordSuccess extends ResetPasswordState {
 final String emailAuth;
 ResetPasswordSuccess({required this.emailAuth});
}
final class ResetPasswordFailure extends ResetPasswordState {
  final String error;
  ResetPasswordFailure({required this.error});
}
