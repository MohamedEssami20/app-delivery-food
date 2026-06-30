import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class AdminRepo {
  Future<Either<Failure, String>> getAdminToken();
}