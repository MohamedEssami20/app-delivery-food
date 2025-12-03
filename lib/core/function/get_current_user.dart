import 'dart:convert';

import 'package:app_delivey_food/core/services/shared_pref_services.dart';
import 'package:app_delivey_food/features/auth/domain/entities/user_entity.dart';

import '../../features/auth/data/models/user_model.dart';
import '../utils/app_keys.dart';

UserEntity getCurrentUser() {
  String? jsonData = SharedPrefrenceSigelton.getString(key: AppKeys.kUserData);
  UserEntity user = UserModel.fromMap(json.decode(jsonData!)).toEntity();
  return user;
}
