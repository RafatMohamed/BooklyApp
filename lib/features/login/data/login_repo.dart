import 'package:bookly_app_t/core/error/handel_error.dart';
import 'package:bookly_app_t/core/models/auth_user.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo{
  Future <Either<String,UserModelAuth>> loginUser({required UserModelAuth user}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email,
          password: user.password
      );
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(getErrorMessage(e));
    }
  }
}