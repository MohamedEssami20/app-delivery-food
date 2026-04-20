import 'package:app_delivey_food/core/utils/backend_end_point.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.username,
    required super.userEmail,
    required super.userImage,
    required super.phoneNumber,
    required super.phoneCode,
    required super.birthDate,
  });

  factory UserModel.formUserEntity({required UserEntity userEntity}) {
    return UserModel(
      uid: userEntity.uid,
      username: userEntity.username,
      userEmail: userEntity.userEmail,
      userImage: userEntity.userImage,
      phoneNumber: userEntity.phoneNumber,
      phoneCode: userEntity.phoneCode,
      birthDate: userEntity.birthDate,
    );
  }

  factory UserModel.fromFirebaseUser({required User user}) {
    return UserModel(
      uid: user.uid,
      username: user.displayName ?? 'User',
      userEmail: user.email ?? '',
      userImage: user.photoURL ?? BackendEndpoints.defaultImage,
      phoneNumber: 0,
      phoneCode: 0,
      birthDate: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'userName': username,
      'email': userEmail,
      'imageUrl': userImage,
      'phoneNumber': phoneNumber,
      'phoneCode': phoneCode,
      'birthDate': birthDate,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      username: username,
      userEmail: userEmail,
      userImage: userImage,
      phoneNumber: phoneNumber,
      phoneCode: phoneCode,
      birthDate: birthDate,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['id'] ?? '',
      username: map['userName'] ?? '',
      userEmail: map['email'] ?? '',
      userImage: map['imageUrl'] ?? BackendEndpoints.defaultImage,
      phoneNumber: map['phoneNumber'] ?? 0,
      phoneCode: map['phoneCode'] ?? 0,
      birthDate: map['birthDate'] ?? '',
    );
  }
}
