import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/features/auth/presentation/views/login_view.dart';
import 'package:app_delivey_food/features/on_borading/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/services/shared_pref_services.dart';
import '../../../../../core/utils/app_keys.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToOnBoardingView();
    super.initState();
  }

  // create method that navigate to onBoarding view after 3 seconds;
  Future<void> navigateToOnBoardingView() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    final isShowOnboarding =
        SharedPrefrenceSigelton.getBoolean(key: AppKeys.isShowedOnboarding) ??
        false;
    if (isShowOnboarding) {
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    } else {
      SharedPrefrenceSigelton.setBoolean(AppKeys.isShowedOnboarding, true);
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppThemeHelper(context).colors.primary100,
      child: Center(child: SvgPicture.asset(Assets.assetsImagesSplash)),
    );
  }
}
