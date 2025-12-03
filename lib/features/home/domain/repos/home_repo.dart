import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/domain/entities/user_entity.dart';

abstract class HomeRepo {
  // create method that get user data;
  Future<Either<Failure, UserEntity>> getUserData();
}
