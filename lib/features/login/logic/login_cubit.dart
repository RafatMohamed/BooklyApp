import 'package:bookly_app_t/core/models/auth_user.dart';
import 'package:bookly_app_t/features/login/data/login_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginCubit() : super(LoginInitial());
  LoginRepo loginRepo = LoginRepo();
  Future<void> userLogin(UserModelAuth user) async {
    emit(LoginLoading());
    var userLogin = await loginRepo.loginUser(user: user);
    userLogin.fold(
      (error) => emit(LoginFailure(error: error)),
      (user) => emit(LoginSuccess(userModelAuth: user)),
    );
  }
}
