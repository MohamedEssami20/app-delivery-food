import 'package:app_delivey_food/core/entities/product_entity.dart';

import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/core/errors/firebase_exception_handler.dart';
import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/core/utils/backend_end_point.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/models/product_model.dart';
import '../../entities/repos/explore_product_repo.dart';

class ExploreProductRepoImpl implements ExploreProductRepo {
  final DataBaseService dataBaseService;
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
      return Right(products);
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
}
