import 'package:app_delivey_food/core/function/build_home_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helper/app_theme_helper.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [buildHomeAppBar(theme)],
      ),
    );
  }
}
