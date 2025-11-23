import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninExeceptionHandler  extends Failure{
  GoogleSigninExeceptionHandler({required super.errorMessage});

  factory GoogleSigninExeceptionHandler.fromGoogleSignInException(GoogleSignInExceptionCode errorMessage){
    return GoogleSigninExeceptionHandler(errorMessage: getErrorMessage(errorMessage));
  }

  static String getErrorMessage(GoogleSignInExceptionCode code){
    switch(code){
      case GoogleSignInExceptionCode.canceled:
        return "The sign-in flow was canceled by the user.";
      case GoogleSignInExceptionCode.interrupted:
        return "The sign-in flow was interrupted.";
      case GoogleSignInExceptionCode.clientConfigurationError:
        return "The sign-in flow failed due to a client configuration error.";
      case GoogleSignInExceptionCode.providerConfigurationError:
        return "The sign-in flow failed due to a provider configuration error.";
      case GoogleSignInExceptionCode.uiUnavailable:
        return "The sign-in flow failed due to UI being unavailable.";
      case GoogleSignInExceptionCode.userMismatch:
        return "The sign-in flow failed due to a user mismatch.";
      default:
        return "An unknown error occurred.";
    }
  }
}