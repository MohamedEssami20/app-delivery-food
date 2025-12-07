import 'package:app_delivey_food/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class SearchRepo {
  // create method that serach products from database as stream;
  Stream<Either<Failure, List<ProductEntity>>> searchProduct({
    required String query,
  });
}
