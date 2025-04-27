import 'package:bookly_app_t/core/models/auth_user.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepo{
  Future <Either<String,UserModelAuth>> registerUser({required UserModelAuth user}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      return right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }
}