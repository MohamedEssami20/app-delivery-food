import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class FavoriteFoodRepos {
  // create method that add favorite food;
  Future<Either<Failure, void>> addFavoriteFood({
    required ProductEntity prductEntity,
  });
}
