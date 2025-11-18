import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class OnBoardingDotsIndicator extends StatelessWidget {
  const OnBoardingDotsIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Container(
      height: 14,
      width: 14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? theme.colors.primary500 : theme.colors.grey200,
      ),
    );
  }
}
