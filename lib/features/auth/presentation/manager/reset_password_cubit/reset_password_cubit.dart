import 'package:app_delivey_food/features/auth/domain/repos/auth_repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.authRepos}) : super(ResetPasswordInitial());

  final AuthRepos authRepos;
  // create method that reset password user;
  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoadingState());
    final result = await authRepos.resetPassword(email: email);
    result.fold(
      (l) => emit(ResetPasswordFailureState(errorMessage: l.errorMessage)),
      (r) => emit(ResetPasswordSuccessState()),
    );
  }
}
