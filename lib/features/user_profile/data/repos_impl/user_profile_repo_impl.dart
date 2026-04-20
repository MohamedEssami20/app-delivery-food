import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/core/errors/firebase_exception_handler.dart';
import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/core/services/shared_pref_services.dart';
import 'package:app_delivey_food/core/services/supabase_storage_service.dart';
import 'package:app_delivey_food/core/utils/app_keys.dart';
import 'package:app_delivey_food/core/utils/backend_end_point.dart';
import 'package:app_delivey_food/features/auth/data/models/user_model.dart';
import 'package:app_delivey_food/features/auth/domain/entities/user_entity.dart';
import 'package:app_delivey_food/features/user_profile/domain/repos/user_profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileRepoImpl extends UserProfileRepo {
  final DataBaseService dataBaseService;

  UserProfileRepoImpl({required this.dataBaseService});

  @override
  Future<Either<Failure, UserEntity>> updateUserData({
    required UserEntity userEntity,
    File? profileImage,
  }) async {
    try {
      String imageUrl = userEntity.userImage;

      if (profileImage != null) {
        final uploadedUrl = await SupabaseStorageService.uploadProfileImage(
          profileImage,
          userEntity.uid,
        );
        if (uploadedUrl != null) {
          imageUrl = uploadedUrl;
        }
      }

      final updatedUser = UserEntity(
        uid: userEntity.uid,
        username: userEntity.username,
        userEmail: userEntity.userEmail,
        userImage: imageUrl,
        phoneNumber: userEntity.phoneNumber,
        phoneCode: userEntity.phoneCode,
        birthDate: userEntity.birthDate,
      );

      Map<String, dynamic> userData = UserModel.formUserEntity(
        userEntity: updatedUser,
      ).toJson();

      await dataBaseService.addData(
        path: BackendEndpoints.addUser,
        data: userData,
        documentId: updatedUser.uid,
      );
      // delete old user data from shared preferences
      SharedPrefrenceSigelton.remove(AppKeys.kUserData);
      // add new user data to shared preferences
      String userJson = jsonEncode(userData);
      await SharedPrefrenceSigelton.setString(AppKeys.kUserData, userJson);

      return right(updatedUser);
    } on FirebaseException catch (e) {
      log("Exception in update user profile repo impl= ${e.toString()}");
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      log("Exception in update user profile repo impl= ${e.toString()}");
      return left(
        Failure(
          errorMessage: 'An unexpected error occurred. Please try again later.',
        ),
      );
    }
  }
}
