import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/core/services/shared_pref_services.dart';
import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/features/search/domain/repos/search_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/firebase_exception_handler.dart';
import '../../../../core/utils/backend_end_point.dart';
import '../../../../core/models/product_model.dart';

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
        query: {"where": "name", "isEqualTo": query},
        documentId: null,
        subPath: null,
      );

      await for (var product in data) {
        products = product
            .map((e) => ProductModel.fromJson(e.data()).toEntity())
            .toList();
        yield Right(products);
      }
    } on FirebaseException catch (e) {
      yield Left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      yield Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> storeSearchQuery({required String query}) async {
    final oldQueries = SharedPrefrenceSigelton.getStringList(
      key: BackendEndpoints.getSearchQuery,
    );
    oldQueries?.remove(query);
    if (oldQueries != null) {
      oldQueries.insert(0, query);
      await SharedPrefrenceSigelton.setStringList(
        BackendEndpoints.getSearchQuery,
        oldQueries,
      );
    } else {
      await SharedPrefrenceSigelton.setStringList(
        BackendEndpoints.getSearchQuery,
        [query],
      );
    }
  }

  @override
  List<String?> getSearchQuery() {
    final List<String>? data = SharedPrefrenceSigelton.getStringList(
      key: BackendEndpoints.getSearchQuery,
    );
    return data ?? [];
  }

  @override
  Future<void> deleteSearchQuery({String? query}) async {
    final list =
        SharedPrefrenceSigelton.getStringList(
          key: BackendEndpoints.getSearchQuery,
        ) ??
        [];
    if (list.isNotEmpty) {
      if (query != null) {
        list.remove(query);
        await SharedPrefrenceSigelton.setStringList(
          BackendEndpoints.setQuerySearch,
          list,
        );
      } else {
        SharedPrefrenceSigelton.deleteListOfStrings(
          BackendEndpoints.setQuerySearch,
        );
      }
    }
  }
}
