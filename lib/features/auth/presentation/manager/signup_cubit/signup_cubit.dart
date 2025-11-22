import 'package:app_delivey_food/features/auth/domain/repos/auth_repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_entity.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authRepos}) : super(SignupInitial());
  final AuthRepos authRepos;

  // create method to sign up user with email and password;
  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    final result = await authRepos.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(SignUpFailureState(errorMessage: failure.errorMessage)),
      (userEntity) => emit(SignUpSuccessState(userEntity: userEntity)),
    );
  }
}
