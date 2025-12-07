import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/features/home/domain/entities/product_entity.dart';
import 'package:app_delivey_food/features/search/domain/repos/search_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/firebase_exception_handler.dart';
import '../../../../core/utils/backend_end_point.dart';
import '../../../home/data/models/product_model.dart';

class SearchRepoImpl implements SearchRepo {
  final DataBaseService dataBaseService;
  SearchRepoImpl({required this.dataBaseService});
  @override
  Stream<Either<Failure, List<ProductEntity>>> searchProduct({
    required String query,
  }) async* {
    List<ProductEntity> products = [];
    try {
      final data = dataBaseService.getStreamDataWithDocumentId(
        mainPath: BackendEndpoints.getProducts,
        query: {'where': 'name', 'isEqualTo': query},
        documentId: null,
        subPath: null,
      );

      await for (var product in data) {
        products = product
            .map((e) => ProductModel.fromJson(e.data()).toEntity())
            .toList();
      }

      yield Right(products);
    } on FirebaseException catch (e) {
      yield Left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      yield Left(Failure(errorMessage: e.toString()));
    }
  }
}
