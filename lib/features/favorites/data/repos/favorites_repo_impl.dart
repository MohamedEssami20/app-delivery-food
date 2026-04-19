import 'dart:developer';

import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/core/errors/firebase_exception_handler.dart';
import 'package:app_delivey_food/core/models/product_model.dart';
import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/core/services/firebase_auth_services.dart';
import 'package:app_delivey_food/core/utils/backend_end_point.dart';
import 'package:app_delivey_food/features/favorites/domain/repos/favorites_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../../core/entities/product_entity.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final DataBaseService dataBaseService;
  final FirebaseAuthService firebaseAuthService;

  FavoritesRepoImpl({
    required this.dataBaseService,
    required this.firebaseAuthService,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavoriteProducts() async {
    try {
      final String userId = firebaseAuthService.getCurrentUser()!;

      // get all favorite ids for current user;
      final List<Map<String, dynamic>> favSnapShot =
          await dataBaseService.getDataWithDocumentId(
            mainPath: BackendEndpoints.favourites,
            mainDocumentId: userId,
            subPath: BackendEndpoints.userFavourite,
          );

      if (favSnapShot.isEmpty) {
        return const Right([]);
      }

      // extract favorite product ids;
      final List<String> favIds =
          favSnapShot.map((e) => e['id'] as String).toList();

      // get all products and filter by favorite ids;
      final List<Map<String, dynamic>> allProductsData =
          await dataBaseService.getData(
                path: BackendEndpoints.getProducts,
                documentId: null,
              )
              as List<Map<String, dynamic>>;

      final List<ProductEntity> allProducts =
          allProductsData.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      // filter only favorite products and mark them as favorite;
      final List<ProductEntity> favoriteProducts =
          allProducts
              .where((product) => favIds.contains(product.id))
              .map(
                (product) => ProductEntity(
                  id: product.id,
                  code: product.code,
                  category: product.category,
                  discount: product.discount,
                  name: product.name,
                  description: product.description,
                  price: product.price,
                  productType: product.productType,
                  avrageRating: product.avrageRating,
                  isFavourite: true,
                  calories: product.calories,
                  createdAt: product.createdAt,
                  baseImageUrl: product.baseImageUrl,
                  productImageUrls: product.productImageUrls,
                ),
              )
              .toList();

      return Right(favoriteProducts);
    } on FirebaseException catch (e) {
      log('FirebaseException in getFavoriteProducts: ${e.toString()}');
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      log('Exception in getFavoriteProducts: ${e.toString()}');
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
