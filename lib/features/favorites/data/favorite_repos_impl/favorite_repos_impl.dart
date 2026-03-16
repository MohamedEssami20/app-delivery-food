import 'dart:developer';

import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/core/models/product_model.dart';
import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/features/favorites/domain/favorite_food_repo/favorite_food_repos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/firebase_exception_handler.dart';
import '../../../../core/services/firebase_auth_services.dart';
import '../../../../core/utils/backend_end_point.dart';

class FavoriteReposImpl implements FavoriteFoodRepos {
  final DataBaseService dataBaseService;
  FirebaseAuthService firebaseAuthServices = FirebaseAuthService();
  FavoriteReposImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addFavoriteFood({
    required ProductEntity prductEntity,
  }) async {
    try {
      await dataBaseService.addDataWithDocumentId(
        mainPath: BackendEndpoints.favourites,
        subPath: BackendEndpoints.userFavourite,
        mainDocumentId: firebaseAuthServices.getCurrentUser()!,
        subDocumentId: prductEntity.id.toString(),
        data: ProductModel.fromProductEntity(prductEntity).toMap(),
      );
      return right(null);
    } on FirebaseException catch (e) {
      log("Exception in favorite repo 1= ${e.toString()}");
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      log("Exception in favorite repo 2= ${e.toString()}");
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
