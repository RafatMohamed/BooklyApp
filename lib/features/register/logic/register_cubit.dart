import 'package:bookly_app_t/core/models/auth_user.dart';
import 'package:bookly_app_t/features/register/logic/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterCubit() : super(RegisterInitial());
  RegisterRepo registerRepo = RegisterRepo();
  Future<void> userRegister(UserModelAuth user) async {
    emit(RegisterLoading());
    var userRegister = await registerRepo.registerUser(user: user);
    userRegister.fold(
      (error) => emit(RegisterFailure(error: error)),
      (user) => emit(RegisterSuccess(userModelAuth: user)),
    );
  }
}
