import 'dart:convert';
import 'dart:developer';

import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/core/utils/app_keys.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/firebse_auth_exception_handler.dart';
import '../../../../core/services/data_base_services.dart';
import '../../../../core/services/firebase_auth_services.dart';
import '../../../../core/services/shared_pref_services.dart';
import '../../../../core/utils/backend_end_point.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repos.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepos {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;
  AuthRepoImpl({
    required this.dataBaseService,
    required this.firebaseAuthService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserEntity userEntity = UserEntity(
        userEmail: user.email!,
        username: name,
        uid: user.uid,
        userImage: BackendEndpoints.defaultImage,
      );
      Map<String, dynamic> userData = UserModel.formUserEntity(
        userEntity: userEntity,
      ).toJson();

      await dataBaseService.addData(
        path: BackendEndpoints.addUser,
        data: userData,
        documentId: user.uid,
      );
      log("user data = $userData");
      await saveUserData(userEntity: userEntity);
      return right(userEntity);
    } on FirebaseAuthException catch (error) {
      await deleteUser(user);
      log("Exception in sign up repo impl one= $error");
      return left(FirebaseAuthErrorHandler.fromFirebaseAuthException(error));
    } catch (error) {
      deleteUser(user);
      log("Exception in auth repo impl= ${error.toString()}");
      return left(
        Failure(
          errorMessage: 'An unexpected error occurred. Please try again later.',
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log("user id= ${user.uid.toString()}");
      UserEntity userEntity = await getUserData(uid: user.uid);
      log("user entity= ${userEntity.toString()}");
      saveUserData(userEntity: userEntity);
      return right(userEntity);
    } on FirebaseAuthException catch (error) {
      log("error to sign in = $error");
      return left(FirebaseAuthErrorHandler.fromFirebaseAuthException(error));
    } catch (error) {
      log("Exception in auth repo impl signin= $error");
      return left(
        Failure(
          errorMessage: 'An unexpected error occurred. Please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      bool isDataExists = await dataBaseService.checkDataExists(
        path: BackendEndpoints.addUser,
        documentId: user.uid,
      );
      if (isDataExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(userEntity: UserModel.fromFirebaseUser(user: user));
      }
      return right(UserModel.fromFirebaseUser(user: user));
    } on FirebaseAuthException catch (error) {
      deleteUser(user);
      return left(FirebaseAuthErrorHandler.fromFirebaseAuthException(error));
    } catch (error) {
      log("Exception in auth repo impl signin= ${error.toString()}");
      return left(
        Failure(
          errorMessage: "An unexpected error occurred. Please try again later.",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user: user));
    } on FirebaseAuthException catch (error) {
      deleteUser(user);
      return left(FirebaseAuthErrorHandler.fromFirebaseAuthException(error));
    } catch (error) {
      log("Exception in auth repo impl signin= ${error.toString()}");
      return left(
        Failure(
          errorMessage: "An unexpected error occurred. Please try again later.",
        ),
      );
    }
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    Map<String, dynamic> data = await dataBaseService.getData(
      path: BackendEndpoints.addUser,
      documentId: uid,
    );
    return UserModel.fromMap(data).toEntity();
  }

  @override
  Future<bool> isDataExists({
    required String path,
    required String documentId,
  }) async {
    return await dataBaseService.checkDataExists(
      path: path,
      documentId: documentId,
    );
  }

  @override
  Future saveUserData({required UserEntity userEntity}) async {
    String jsonData = jsonEncode(
      UserModel.formUserEntity(userEntity: userEntity).toJson(),
    );
    await SharedPrefrenceSigelton.setString(AppKeys.kUserData, jsonData);
  }

  @override
  Future<void> addUserData({
    required UserEntity userEntity,
    String? documentId,
  }) async {
    Map<String, dynamic> userData = UserModel.formUserEntity(
      userEntity: userEntity,
    ).toJson();
    await dataBaseService.addData(
      path: BackendEndpoints.addUser,
      data: userData,
      documentId: documentId!,
    );
  }
}
