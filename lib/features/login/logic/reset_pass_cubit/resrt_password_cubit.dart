

import 'package:bookly_app_t/features/login/data/reset_password_repo.dart';
import 'package:bookly_app_t/features/login/logic/reset_pass_cubit/resrt_password_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  ResetPasswordRepo resetPasswordRepo =ResetPasswordRepo();
  final TextEditingController resetEmailController =TextEditingController();
  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  Future<void> resetPassword({required String emailAuth}) async{
    emit(ResetPasswordLoading());
  var reset =await resetPasswordRepo.resetPassword(emailAuth: emailAuth);
  reset.fold(
          (error) =>emit(ResetPasswordFailure(error: error)) ,
      (email) =>emit(ResetPasswordSuccess(emailAuth: email)) ,
  );
  }
}
