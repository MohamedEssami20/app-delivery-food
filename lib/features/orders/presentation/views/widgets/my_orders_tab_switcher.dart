import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class MyOrdersTabSwitcher extends StatelessWidget {
  const MyOrdersTabSwitcher({
    super.key,
    required this.isCurrentSelected,
    required this.hasCurrentOrders,
    required this.onCurrentTap,
    required this.onPreviousTap,
  });

  final bool isCurrentSelected;
  final bool hasCurrentOrders;
  final VoidCallback onCurrentTap;
  final VoidCallback onPreviousTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: theme.colors.grey100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          // Current tab;
          Expanded(
            child: GestureDetector(
              onTap: onCurrentTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.decelerate,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isCurrentSelected ? theme.colors.grey0 : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: isCurrentSelected
                      ? [
                          BoxShadow(
                            color: theme.colors.grey300.withValues(alpha: 0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6,
                  children: [
                    Text(
                      'Current',
                      textAlign: TextAlign.center,
                      style: theme.textStyles.titleSmall!.copyWith(
                        color: isCurrentSelected
                            ? theme.colors.typography500
                            : theme.colors.grey400,
                        fontWeight: isCurrentSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),
                    // red dot indicator;
                    if (hasCurrentOrders)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: theme.colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          // Previous tab;
          Expanded(
            child: GestureDetector(
              onTap: onPreviousTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.decelerate,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !isCurrentSelected ? theme.colors.grey0 : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: !isCurrentSelected
                      ? [
                          BoxShadow(
                            color: theme.colors.grey300.withValues(alpha: 0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  'Previous',
                  textAlign: TextAlign.center,
                  style: theme.textStyles.titleSmall!.copyWith(
                    color: !isCurrentSelected
                        ? theme.colors.typography500
                        : theme.colors.grey400,
                    fontWeight: !isCurrentSelected
                        ? FontWeight.w700
                        : FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
