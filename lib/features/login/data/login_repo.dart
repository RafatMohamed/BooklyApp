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
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return Left(e.toString());
    }
  }
}