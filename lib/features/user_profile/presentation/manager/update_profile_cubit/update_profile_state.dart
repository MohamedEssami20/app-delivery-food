import 'package:app_delivey_food/features/auth/domain/entities/user_entity.dart';

abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final UserEntity user;
  UpdateProfileSuccess({required this.user});
}

class UpdateProfileFailure extends UpdateProfileState {
  final String errorMessage;
  UpdateProfileFailure({required this.errorMessage});
}
