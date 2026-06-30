import 'dart:developer';

import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/core/errors/firebase_exception_handler.dart';
import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/core/utils/backend_end_point.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../services/firebase_auth_services.dart';
import 'user_repo.dart';

class UserRepoImpl implements UserRepo {
  UserRepoImpl({required this.dataBaseService});
  final DataBaseService dataBaseService;
  @override
  Future<void> updateUserToken(String token) async {
    final user = GetIt.instance.get<FirebaseAuthService>().getCurrentUser();
    if (user != null) {
      try {
        await dataBaseService.updateData(
          path: BackendEndpoints.addUser,
          data: {'fcmToken': token},
          documentId: user,
        );
      } on FirebaseException catch (error) {
        log("Failed to update token :${error.message}");
        FirebaseExceptionHandler.fromFirebaseException(error);
      } catch (error) {
        log("Failed to update token :$error");
      }
    }
  }

  @override
  Future<Either<Failure, String>> getUserToken() async {
    try {
      final uid = GetIt.instance.get<FirebaseAuthService>().getCurrentUser();
      if (uid == null) {
        return left(Failure(errorMessage: "User is not logged in"));
      }

      final token = await dataBaseService.getData(
        path: BackendEndpoints.addUser,
        documentId: uid,
      );
      return right(token['fcmToken']);
    } on FirebaseException catch (error) {
      log("Failed to get token :${error.message}");
      return left(FirebaseExceptionHandler.fromFirebaseException(error));
    } catch (error) {
      log("Failed to get token :$error");
      return left(Failure(errorMessage: error.toString()));
    }
  }
}
