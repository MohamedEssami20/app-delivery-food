import 'dart:developer';

import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/core/errors/firebase_exception_handler.dart';
import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/core/services/firebase_auth_services.dart';
import 'package:app_delivey_food/features/orders/domain/repos/orders_repos.dart'
    show OrdersRepos;
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../../core/utils/backend_end_point.dart';

class OrdersReposImpl implements OrdersRepos {
  final DataBaseService dataBaseService;
  FirebaseAuthService authService = FirebaseAuthService();
  OrdersReposImpl({required this.dataBaseService});
  @override
  Stream<Either<Failure, String>> getOrders({required int orderId}) async* {
    try {
      final data = dataBaseService.getStreamDataWithSubDocumentId(
        mainPath: BackendEndpoints.addOrder,
        subPath: BackendEndpoints.userOrders,
        mainDocumentId: authService.getCurrentUser(),
        subDocumentId: orderId.toString(),
      );

      yield* data.map((event) => Right(event.data()?['orderState'] ?? ''));
    } on FirebaseException catch (e) {
      log("error to get status of order 1 = $e");
      yield Left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      log("error to get status of order 2 = $e");
      yield Left(Failure(errorMessage: e.toString()));
    }
  }
}
