import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UserRepo{
  Future<void> updateUserToken(String token);

  Future<Either<Failure , String>> getUserToken();
}