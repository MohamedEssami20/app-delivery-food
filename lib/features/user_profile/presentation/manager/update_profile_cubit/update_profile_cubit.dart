import 'dart:io';

import 'package:app_delivey_food/features/auth/domain/entities/user_entity.dart';
import 'package:app_delivey_food/features/user_profile/domain/repos/user_profile_repo.dart';
import 'package:app_delivey_food/features/user_profile/presentation/manager/update_profile_cubit/update_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UserProfileRepo userProfileRepo;

  UpdateProfileCubit(this.userProfileRepo) : super(UpdateProfileInitial());

  Future<void> updateProfile({
    required UserEntity userEntity,
    File? profileImage,
  }) async {
    emit(UpdateProfileLoading());
    var result = await userProfileRepo.updateUserData(
      userEntity: userEntity,
      profileImage: profileImage,
    );
    result.fold(
      (failure) =>
          emit(UpdateProfileFailure(errorMessage: failure.errorMessage)),
      (user) => emit(UpdateProfileSuccess(user: user)),
    );
  }
}
