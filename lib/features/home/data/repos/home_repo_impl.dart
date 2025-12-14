import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/core/errors/firebase_exception_handler.dart';
import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/core/services/firebase_auth_services.dart';
import 'package:app_delivey_food/core/utils/backend_end_point.dart';

import 'package:app_delivey_food/features/auth/domain/entities/user_entity.dart';
import 'package:app_delivey_food/core/models/product_model.dart';
import 'package:app_delivey_food/core/entities/product_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../auth/data/models/user_model.dart';
import '../../domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DataBaseService dataBaseService;
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  HomeRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, UserEntity>> getUserData() async {
    try {
      final userData = dataBaseService.getData(
        path: BackendEndpoints.getUsers,
        documentId: firebaseAuthService.getCurrentUser()!,
      );
      final user = UserModel.fromMap(await userData).toEntity();
      return Right(user);
    } on FirebaseException catch (e) {
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required int category,
  }) async {
    try {
      final List<Map<String, dynamic>> data = await dataBaseService.getData(
        path: BackendEndpoints.getProducts,
        query: {'where': 'code', 'isEqualTo': category},
        documentId: null,
      );
      final products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return Right(products);
    } on FirebaseException catch (e) {
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAdvertiseProducts() async {
    try {
      final List<Map<String, dynamic>> data = await dataBaseService.getData(
        path: BackendEndpoints.getProducts,
        query: {
          'where': 'category',
          'isEqualTo': BackendEndpoints.getAdvertisingProducts,
        },
        documentId: null,
      );
      final products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return Right(products);
    } on FirebaseException catch (e) {
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
