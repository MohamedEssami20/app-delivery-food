import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:app_delivey_food/core/errors/failure.dart';
import 'package:app_delivey_food/features/auth/domain/entities/user_entity.dart';

abstract class UserProfileRepo {
  Future<Either<Failure, UserEntity>> updateUserData({
    required UserEntity userEntity,
    File? profileImage,
  });
}
