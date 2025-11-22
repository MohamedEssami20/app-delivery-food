import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/core/services/firebase_auth_services.dart';
import 'package:app_delivey_food/core/services/firestore_services.dart';
import 'package:app_delivey_food/features/auth/data/repos_impl/auth_repos_impl.dart';
import 'package:app_delivey_food/features/auth/domain/repos/auth_repos.dart';
import 'package:get_it/get_it.dart';

class GetItService {
  static GetIt getIt = GetIt.instance;

  GetItService();
  void setupGetIt() {
    getIt.registerSingleton<DataBaseService>(FirestoreService());

    getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

    getIt.registerSingleton<AuthRepos>(
      AuthRepoImpl(
         firebaseAuthService: getIt<FirebaseAuthService>(),
          dataBaseService: getIt<DataBaseService>(),
      ),
    );
  }
}
