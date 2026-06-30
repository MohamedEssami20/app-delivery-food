import 'dart:developer';

import 'package:app_delivey_food/core/repos/admin_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../errors/failure.dart';
import '../services/data_base_services.dart';
import '../utils/backend_end_point.dart';

class AdminRepoImpl implements AdminRepo {
  final DataBaseService dataBaseService;
  AdminRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, String>> getAdminToken() async {
    try {
      final adminData = await dataBaseService.getData(
        path: BackendEndpoints.adminCollection,
        documentId: BackendEndpoints.adminTokenDocument,
      );
      if (adminData != null && adminData is Map<String, dynamic>) {
        final token = adminData['fcmToken'] as String?;
        if (token != null && token.isNotEmpty) {
          return right(token);
        }
      }
      log("Admin token  found in Firestor = $adminData.");
      return right(BackendEndpoints.adminToken);
    } on FirebaseException catch (e) {
      log(
        "FirebaseException fetching admin token: ${e.toString()}. Falling back to static admin token.",
      );
      return right(BackendEndpoints.adminToken);
    } catch (e) {
      log(
        "Exception fetching admin token: ${e.toString()}. Falling back to static admin token.",
      );
      return right(BackendEndpoints.adminToken);
    }
  }
}