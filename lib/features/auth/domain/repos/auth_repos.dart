import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepos {
  //create method that sign up user with email and password;
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  //create method that sign in user with email and password;
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  // create method that sign in user with google;
  Future<Either<Failure, UserEntity>> signInWithGoogle();

  // create method that sign in user with facebook;
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  // create method that add user data to database;
  Future<void> addUserData({required UserEntity userEntity, String? documentId});

  // create method that get user data from database;
  Future<UserEntity> getUserData({required String uid});

  // create method that save user data to local storage;
  Future<void> saveUserData({required UserEntity userEntity});

  // create method that check if user data is exits in database;
  Future<bool> isDataExists({required String path, required String documentId});

  // create method that reset password;
  Future<Either<Failure, void>> resetPassword({required String email});
}
