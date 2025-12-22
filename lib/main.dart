
import 'package:app_delivey_food/core/helper/custom_bloc_observer.dart';
import 'package:app_delivey_food/core/helper/on_generate_route.dart';
import 'package:app_delivey_food/core/services/firebase_auth_services.dart';
import 'package:app_delivey_food/core/services/get_it_services.dart';
import 'package:app_delivey_food/core/services/shared_pref_services.dart';
import 'package:app_delivey_food/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:app_delivey_food/features/splash/presentation/views/splash_view.dart';
import 'package:app_delivey_food/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAuthService().initializeGoogleSignIn();
  Bloc.observer = CustomBlocObserver();
  GetItService().setupGetIt();
  await SharedPrefrenceSigelton.init();
  runApp(const AppDeliveryFood());
}

class AppDeliveryFood extends StatelessWidget {
  const AppDeliveryFood({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: MaterialApp(
        theme: AppTheme.lightTheme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: SplashView.routeName,
      ),
    );
  }
}
