import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/features/checkout/domain/entities/address_input_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OrdersRepos {
  // create method that get order as stream from database;
  Stream<Either<Failure, List<AddressAndOrderInputEntity>>> getOrders();
}
