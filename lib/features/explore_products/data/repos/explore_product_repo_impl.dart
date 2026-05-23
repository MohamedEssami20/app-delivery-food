import 'package:app_delivey_food/core/entities/product_entity.dart';

import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/core/errors/firebase_exception_handler.dart';
import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/core/services/firebase_auth_services.dart';
import 'package:app_delivey_food/core/utils/backend_end_point.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/models/product_model.dart';
import '../../entities/repos/explore_product_repo.dart';

class ExploreProductRepoImpl implements ExploreProductRepo {
  final DataBaseService dataBaseService;
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  ExploreProductRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsOfCategory({
    required String category,
  }) async {
    try {
      List<ProductEntity> products = [];
      final data =
          await dataBaseService.getData(
                path: BackendEndpoints.getProducts,
                query: {'where': 'category', 'isEqualTo': category},
                documentId: null,
              )
              as List<Map<String, dynamic>>;
      products = data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      final favSnapShot = await dataBaseService.getDataWithDocumentId(
        mainPath: BackendEndpoints.favourites,
        mainDocumentId: firebaseAuthService.getCurrentUser()!,
        subPath: BackendEndpoints.userFavourite,
      );
      return Right(getFinalProducts(products, favSnapShot));
    } on FirebaseException catch (e) {
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      return left(
        Failure(
          errorMessage: "An unexpected error occurred. Please try again later.",
        ),
      );
    }
  }

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
}
