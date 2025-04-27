import 'package:bookly_app_t/core/models/auth_user.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordRepo {
  Future<Either<String, String>> resetPassword({required dynamic emailAuth,}) async {
    if (emailAuth.isEmpty) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAuth);
      return  Right("Password reset link sent to $emailAuth");
      } on FirebaseAuthException catch (e) {
       return left(e.toString());
      } catch (e) {
       return left("failed to send reset email ${e.toString()}");
      }
    }
    return right(emailAuth);
  }
}
