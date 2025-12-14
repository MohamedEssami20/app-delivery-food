import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class SearchRepo {
  // create method that serach products from database as stream;
  Stream<Either<Failure, List<ProductEntity>>> searchProduct({
    required String query,
  });

  // create method that store query for search products;
  Future<void> storeSearchQuery({required String query});

  // create method that get search query from shared preferences;
  List<String?> getSearchQuery();

  // create method that delete search query from shared preferences;
  Future<void> deleteSearchQuery({String? query});
}
