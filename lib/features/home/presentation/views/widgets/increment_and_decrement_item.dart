import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class IncrementAndDecremntItem extends StatelessWidget {
  const IncrementAndDecremntItem({
    super.key,
    required this.iconData,
    this.onPressed,
  });
  final IconData iconData;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppThemeHelper(context).colors.grey200,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(20),
          color: theme.colors.grey200,
        ),
        child: Icon(iconData, color: theme.colors.typography500),
      ),
    );
  }
}
