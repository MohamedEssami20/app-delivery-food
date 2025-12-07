import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/core/services/firebase_auth_services.dart';
import 'package:app_delivey_food/core/services/firestore_services.dart';
import 'package:app_delivey_food/features/auth/data/repos_impl/auth_repos_impl.dart';
import 'package:app_delivey_food/features/auth/domain/repos/auth_repos.dart';
import 'package:app_delivey_food/features/home/data/repos/home_repo_impl.dart';
import 'package:app_delivey_food/features/home/domain/repos/home_repo.dart';
import 'package:app_delivey_food/features/search/data/repos/search_repo_impl.dart';
import 'package:app_delivey_food/features/search/domain/repos/search_repo.dart';
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

    getIt.registerSingleton<HomeRepo>(
      HomeRepoImpl(dataBaseService: getIt<DataBaseService>()),
    );
    getIt.registerSingleton<SearchRepo>(
      SearchRepoImpl(dataBaseService: getIt<DataBaseService>()),
    );
  }
}
