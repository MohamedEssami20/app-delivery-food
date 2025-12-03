import 'package:app_delivey_food/features/home/domain/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/domain/entities/user_entity.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.homeRepo}) : super(UserInitial());
  final HomeRepo homeRepo;

  //create method that get user data;
  Future<void> getUserData() async {
    emit(GetUserLoading());
    final result = await homeRepo.getUserData();
    result.fold(
      (l) => emit(GetUserError(errorMessage: l.errorMessage)),
      (r) => emit(GetUserSuccess(userEntity: r)),
    );
  }
}
