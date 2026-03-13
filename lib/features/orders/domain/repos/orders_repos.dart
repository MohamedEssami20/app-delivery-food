import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class OrdersRepos {
  // create method that get state of current order as stream;
  Stream<Either<Failure, String>> getOrders({required int orderId});

  // create method that cancel order ;
  Future<Either<Failure, void>> cancelOrder({required int orderId, required String reason});
}
