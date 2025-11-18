import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/features/on_borading/presentation/views/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String routeName = 'onBoardingView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeHelper(context).colors.grey0,
      body: SafeArea(child: OnBoardingViewBody()),
    );
  }
}
