import 'package:flutter/material.dart';
import '../../../../../core/helper/app_theme_helper.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    required this.isActive,
    this.onTap,
  });

  final String title;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutQuint,
        width: isActive ? 120 : 110,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        decoration: BoxDecoration(
          color: isActive ? theme.colors.primary500 : theme.colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isActive ? theme.colors.primary500 : theme.colors.grey200,
            width: 1.2,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: theme.colors.primary500.withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          style: theme.textStyles.titleMedium!.copyWith(
            color: isActive ? Colors.white : theme.colors.typography500,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          ),
          child: Text(title),
        ),
      ),
    );
  }
}
