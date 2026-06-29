import 'dart:developer';

import 'package:app_delivey_food/core/errors/firebase_exception_handler.dart';
import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/core/services/firebase_auth_services.dart';
import 'package:app_delivey_food/core/services/cloudflare_notification_service.dart';
import 'package:app_delivey_food/features/checkout/domain/entities/address_input_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/backend_end_point.dart';
import '../../domain/repos/checkout_repo.dart';
import '../models/address_input_model.dart';

class CheckoutReposImpl implements CheckoutRepo {
  final DataBaseService dataBaseService;
  final CloudflareNotificationService cloudflareNotificationService;
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  CheckoutReposImpl({
    required this.dataBaseService,
    required this.cloudflareNotificationService,
  });
  @override
  Future<Either<Failure, void>> addOreder({
    required AddressAndOrderInputEntity addressInputEntity,
  }) async {
    try {
      final data = AddressAndOrderInputModel.fromEntity(
        addressInputEntity,
      ).toMap();
      await dataBaseService.addDataWithDocumentId(
        mainPath: BackendEndpoints.addOrder,
        subPath: BackendEndpoints.userOrders,
        data: data,
        mainDocumentId: firebaseAuthService.getCurrentUser()!,
        subDocumentId: data['id'].toString(),
      );

      // Fetch admin token from Firestore and send notification
      final adminTokenResult = await getAdminToken();
      await adminTokenResult.fold(
        (failure) async {
          log("Failed to fetch admin token: ${failure.errorMessage}");
        },
        (adminToken) async {
          if (adminToken.isNotEmpty) {
            try {
              await cloudflareNotificationService.sendNotificationToToken(
                token: adminToken,
                title: "New Order Placed!",
                body:
                    "A new order (#${data['id']}) has been placed by ${addressInputEntity.name}.",
                data: {
                  'orderId': data['id'].toString(),
                  'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                },
              );
              log("Admin notification sent successfully to token: $adminToken");
            } catch (e) {
              log("Failed to send notification to admin: ${e.toString()}");
            }
          }
        },
      );

      return right(null);
    } on FirebaseException catch (e) {
      log("Exception in checkout repo 1= ${e.toString()}");
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      log("Exception in checkout repo 2= ${e.toString()}");
      return left(Failure(errorMessage: e.toString()));
    }
  }

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
