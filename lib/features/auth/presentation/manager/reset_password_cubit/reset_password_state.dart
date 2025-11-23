part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

// create reset password states;

final class ResetPasswordLoadingState extends ResetPasswordState {}

final class ResetPasswordFailureState extends ResetPasswordState {
  final String errorMessage;
  ResetPasswordFailureState({required this.errorMessage});
}

final class ResetPasswordSuccessState extends ResetPasswordState {}
