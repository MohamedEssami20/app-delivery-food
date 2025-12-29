import 'package:app_delivey_food/core/services/data_base_services.dart';
import 'package:app_delivey_food/core/services/firebase_auth_services.dart';
import 'package:app_delivey_food/core/services/firestore_services.dart';
import 'package:app_delivey_food/features/auth/data/repos_impl/auth_repos_impl.dart';
import 'package:app_delivey_food/features/auth/domain/repos/auth_repos.dart';
import 'package:app_delivey_food/features/checkout/data/repos/checkout_repos_impl.dart';
import 'package:app_delivey_food/features/checkout/domain/repos/checkout_repo.dart';
import 'package:app_delivey_food/features/explore_products/entities/repos/explore_product_repo.dart';
import 'package:app_delivey_food/features/home/data/repos/home_repo_impl.dart';
import 'package:app_delivey_food/features/home/domain/repos/home_repo.dart';
import 'package:app_delivey_food/features/search/data/repos/search_repo_impl.dart';
import 'package:app_delivey_food/features/search/domain/repos/search_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/explore_products/data/repos/explore_product_repo_impl.dart';

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

    getIt.registerSingleton<ExploreProductRepo>(
      ExploreProductRepoImpl(dataBaseService: getIt<DataBaseService>()),
    );

    getIt.registerSingleton<CheckoutRepo>(
      CheckoutReposImpl(dataBaseService: getIt<DataBaseService>()),
    );
  }
}
