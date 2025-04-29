import 'package:bookly_app_t/core/models/auth_user.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/handel_error.dart';

class RegisterRepo{
  Future<Either<String, UserModelAuth>> registerUser({required UserModelAuth user}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      return right(user);
    } on FirebaseAuthException catch (e) {
      return Left(getErrorMessage(e));
    } catch (e) {
      return left(e.toString());
    }
  }
}