import 'package:dartz/dartz.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class FavoritesRepo {
  // create method that get all favorite products for current user;
  Future<Either<Failure, List<ProductEntity>>> getFavoriteProducts();
}
