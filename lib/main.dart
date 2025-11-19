import 'package:app_delivey_food/core/helper/on_generate_route.dart';
import 'package:app_delivey_food/core/services/shared_pref_services.dart';
import 'package:app_delivey_food/core/utils/app_theme.dart';
import 'package:app_delivey_food/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrenceSigelton.init();
  runApp(const AppDeliveryFood());
}

class AppDeliveryFood extends StatelessWidget {
  const AppDeliveryFood({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
