import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/address_input_entity.dart';

abstract class CheckoutRepo {
  // create method that add and save order to database;
  Future<Either<Failure, void>> addOreder({
    required AddressAndOrderInputEntity addressInputEntity,
  });
}
