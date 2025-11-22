import 'package:app_delivey_food/features/auth/domain/repos/auth_repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_entity.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepos}) : super(LoginInitial());

  final AuthRepos authRepos;

  // create method that login user with email and password;
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LogInLoadingState());
    final result = await authRepos.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(LogInFailureState(errorMessage: failure.errorMessage)),
      (userEntity) => emit(LogInSuccessState(userEntity: userEntity)),
    );
  }

  // create method that login user with google account;
  Future<void> loginUserWithGoogle() async {
    emit(LogInWithGoogleLoadingState());
    final result = await authRepos.signInWithGoogle();
    result.fold(
      (failure) => emit(LogInWithGoogleFailureState(errorMessage: failure.errorMessage)),
      (userEntity) => emit(LogInWithGoogleSuccessState(userEntity: userEntity)),
    );
  }

  // create method that login user with facebook account;
  Future<void> loginUserWithFacebook() async {
    emit(LogInWithFacebookLoadingState());
    final result = await authRepos.signInWithFacebook();
    result.fold(
      (failure) => emit(LogInWithFacebookFailureState(errorMessage: failure.errorMessage)),
      (userEntity) => emit(LogInWithFacebookSuccessState(userEntity: userEntity)),
    );
  }
}
