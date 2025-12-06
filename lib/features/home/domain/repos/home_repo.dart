import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../entities/product_entity.dart';

abstract class HomeRepo {
  // create method that get user data;
  Future<Either<Failure, UserEntity>> getUserData();

  // create method that get products of Category;
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required int category,
  });
}
