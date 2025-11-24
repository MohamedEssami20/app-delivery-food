import 'package:app_delivey_food/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Scaffold(
      backgroundColor: theme.colors.white,
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
