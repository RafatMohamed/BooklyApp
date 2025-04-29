import 'package:bookly_app_t/core/error/handel_error.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordRepo {
  Future<Either<String, String>> resetPassword({required String emailAuth}) async {
    if (emailAuth.isEmpty) {
      return const Left("Email cannot be empty.");
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAuth);
      return Right("Password reset link sent to $emailAuth");
    } on FirebaseAuthException catch (e) {
      return Left(getErrorMessage(e));
    } catch (e) {
      return Left("Failed to send reset email: ${e.toString()}");
    }
  }

}
