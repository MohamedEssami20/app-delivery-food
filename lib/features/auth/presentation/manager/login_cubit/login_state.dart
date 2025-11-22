part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
// create all state to Log in user;
final class LogInLoadingState extends  LoginState {}

final class LogInSuccessState extends  LoginState {
  final UserEntity userEntity;
  LogInSuccessState({required this.userEntity});
}

final class LogInFailureState extends  LoginState {
  final String errorMessage;
  LogInFailureState({required this.errorMessage});
}

// create all state to Log in user with google account;
final class LogInWithGoogleLoadingState extends  LoginState {}
final class LogInWithGoogleSuccessState extends  LoginState {
  final UserEntity userEntity;
  LogInWithGoogleSuccessState({required this.userEntity});
}
final class LogInWithGoogleFailureState extends  LoginState {
  final String errorMessage;
  LogInWithGoogleFailureState({required this.errorMessage});
}

// create all state to Log in user with facebook account;
final class LogInWithFacebookLoadingState extends  LoginState {}
final class LogInWithFacebookSuccessState extends  LoginState {
  final UserEntity userEntity;
  LogInWithFacebookSuccessState({required this.userEntity});
}
final class LogInWithFacebookFailureState extends  LoginState {
  final String errorMessage;
  LogInWithFacebookFailureState({required this.errorMessage});
}

