import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthErrorHandler extends Failure {
  FirebaseAuthErrorHandler({required super.errorMessage});

  // create factory constructor that returns an instance of the class;
  factory FirebaseAuthErrorHandler.fromFirebaseAuthException(
    FirebaseAuthException e,
  ) => FirebaseAuthErrorHandler(errorMessage: getErrorMessage(e));
  static String getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-credential':
        return "The credentials you entered are invalid.";
      case 'invalid-email':
        return "Please enter a valid email address.";
      case 'wrong-password':
        return "The password you entered is incorrect.";
      case 'invalid-verification-code':
        return "The verification code is invalid. Please try again.";
      case 'invalid-verification-id':
        return "The verification process could not be completed. Please try again.";
      case 'requires-recent-login':
        return "Please log in again to continue.";
      case 'missing-android-pkg-name':
        return "An Android package name is required to proceed.";
      case 'missing-continue-uri':
        return "A continue URL is required to proceed.";
      case 'missing-ios-bundle-id':
        return "An iOS bundle ID is required to proceed.";
      case 'invalid-continue-uri':
        return "The continue URL provided is invalid.";
      case 'unauthorized-continue-uri':
        return "The continue URL is not authorized.";
      default:
        return "An unexpected error occurred. Please try again later.";
    }
  }
}
