part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

// create all state to get user data;
final class GetUserLoading extends UserState {}

final class GetUserSuccess extends UserState {
  final UserEntity userEntity;
  GetUserSuccess({required this.userEntity});
}

final class GetUserError extends UserState {
  final String errorMessage;
  GetUserError({required this.errorMessage});
}

