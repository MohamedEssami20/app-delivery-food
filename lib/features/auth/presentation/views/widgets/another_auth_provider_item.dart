
import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class AnotherAuthProviderItem extends StatelessWidget {
  const AnotherAuthProviderItem(this.iconPath, {super.key});
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Container(
      height: 60,
      width: 120,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: theme.colors.grey200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Image.asset(iconPath, height: 24, width: 24)),
    );
  }
}