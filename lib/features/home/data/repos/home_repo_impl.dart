
import 'dart:developer';

import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/core/errors/firebase_exception_handler.dart';
import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/core/services/firebase_auth_services.dart';
import 'package:app_delivey_food/core/utils/backend_end_point.dart';

import 'package:app_delivey_food/features/auth/domain/entities/user_entity.dart';
import 'package:app_delivey_food/core/models/product_model.dart';
import 'package:app_delivey_food/core/entities/product_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../auth/data/models/user_model.dart';
import '../../domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DataBaseService dataBaseService;
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  HomeRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, UserEntity>> getUserData() async {
    try {
      final userData = dataBaseService.getData(
        path: BackendEndpoints.getUsers,
        documentId: firebaseAuthService.getCurrentUser()!,
      );
      final user = UserModel.fromMap(await userData).toEntity();
      return Right(user);
    } on FirebaseException catch (e) {
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required int category,
  }) async {
    try {
      final List<Map<String, dynamic>> data = await dataBaseService.getData(
        path: BackendEndpoints.getProducts,
        query: {'where': 'code', 'isEqualTo': category},
        documentId: null,
      );
      final products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      final favSnapShot = await dataBaseService.getDataWithDocumentId(
        mainPath: BackendEndpoints.favourites,
        mainDocumentId: firebaseAuthService.getCurrentUser()!,
        subPath: BackendEndpoints.userFavourite,
      );
      final finalProducts = getFinalProducts(products, favSnapShot);
      return Right(finalProducts);
    } on FirebaseException catch (e) {
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAdvertiseProducts() async {
    try {
      final List<Map<String, dynamic>> data = await dataBaseService.getData(
        path: BackendEndpoints.getProducts,
        query: {
          'where': 'category',
          'isEqualTo': BackendEndpoints.getAdvertisingProducts,
        },
        documentId: null,
      );
      final products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return Right(products);
    } on FirebaseException catch (e) {
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  // create methdod that get final products with final favorite products;

  List<ProductEntity> getFinalProducts(
    List<ProductEntity> products,
    List<Map<String, dynamic>> favProducts,
  ) {
    List<String> favIds = [];

    for (var element in favProducts) {
      favIds.add(element['id']);
    }
    List<ProductEntity> finalProducts = products.map((e) {
      return ProductEntity(
        id: e.id,
        code: e.code,
        category: e.category,
        discount: e.discount,
        name: e.name,
        description: e.description,
        price: e.price,
        productType: e.productType,
        avrageRating: e.avrageRating,
        isFavourite: favIds.contains(e.id),
        calories: e.calories,
        createdAt: e.createdAt,
        baseImageUrl: e.baseImageUrl,
        productImageUrls: e.productImageUrls,
      );
    }).toList();

    return finalProducts;
  }

  @override
  Future<Either<Failure, void>> addFavoriteFood({
    required String foodId,
  }) async {
    try {
      await dataBaseService.addDataWithDocumentId(
        mainPath: BackendEndpoints.favourites,
        subPath: BackendEndpoints.userFavourite,
        mainDocumentId: firebaseAuthService.getCurrentUser()!,
        subDocumentId: foodId,
        data: {
          'id': foodId,
        },
      );
      return right(null);
    } on FirebaseException catch (e) {
      log("Exception in add favorite repo 1= ${e.toString()}");
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      log("Exception in add favorite repo 2= ${e.toString()}");
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavoriteFood({
    required String foodId,
  }) async {
    try {
      await dataBaseService.deleteDataWithDocumentId(
        mainPath: BackendEndpoints.favourites,
        subPath: BackendEndpoints.userFavourite,
        mainDocumentId: firebaseAuthService.getCurrentUser()!,
        subDocumentId: foodId,
      );
      return right(null);
    } on FirebaseException catch (e) {
      log("Exception in remove favorite repo 1= ${e.toString()}");
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      log("Exception in remove favorite repo 2= ${e.toString()}");
      return left(Failure(errorMessage: e.toString()));
    }
  }

}
