import 'package:dartz/dartz.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class ExploreProductRepo {
  // create method that get products of category;
  Future<Either<Failure, List<ProductEntity>>> getProductsOfCategory({required String category});
}