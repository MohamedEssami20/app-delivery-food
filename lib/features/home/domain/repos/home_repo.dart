import 'package:app_delivey_food/features/home/domain/entities/advertising_product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../../core/entities/product_entity.dart';

abstract class HomeRepo {
  // create method that get user data;
  Future<Either<Failure, UserEntity>> getUserData();

  // create method that get products of Category;
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required int category,
  });

  // create method that get advertise products;
  Future<Either<Failure, List<AdvertisingProductEntity>>> getAdvertiseProducts();
}
