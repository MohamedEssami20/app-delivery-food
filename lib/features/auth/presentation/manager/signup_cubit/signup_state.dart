part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

// create all state to sign up user;
final class SignUpLoadingState extends SignupState {}

final class SignUpSuccessState extends SignupState {
  final UserEntity userEntity;
  SignUpSuccessState({required this.userEntity});
}

final class SignUpFailureState extends SignupState {
  final String errorMessage;
  SignUpFailureState({required this.errorMessage});
}