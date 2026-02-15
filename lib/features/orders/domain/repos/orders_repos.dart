import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class OrdersRepos {
  // create method that get state of current order as stream;
  Stream<Either<Failure, String>> getOrders({required int orderId});
}
