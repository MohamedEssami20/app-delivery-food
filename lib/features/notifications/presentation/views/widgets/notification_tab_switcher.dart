import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class NotificationTabSwitcher extends StatelessWidget {
  const NotificationTabSwitcher({
    super.key,
    required this.isNewSelected,
    required this.hasNewNotifications,
    required this.onNewTap,
    required this.onOldTap,
  });

  final bool isNewSelected;
  final bool hasNewNotifications;
  final VoidCallback onNewTap;
  final VoidCallback onOldTap;

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
          // New tab;
          Expanded(
            child: GestureDetector(
              onTap: onNewTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isNewSelected
                      ? theme.colors.grey0
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: isNewSelected
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
                      'New',
                      textAlign: TextAlign.center,
                      style: theme.textStyles.titleSmall!.copyWith(
                        color: isNewSelected
                            ? theme.colors.typography500
                            : theme.colors.grey400,
                        fontWeight: isNewSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),
                    // red dot indicator for new notifications;
                    if (hasNewNotifications)
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

          // Old tab;
          Expanded(
            child: GestureDetector(
              onTap: onOldTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.decelerate,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !isNewSelected
                      ? theme.colors.grey0
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: !isNewSelected
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
                  'Old',
                  textAlign: TextAlign.center,
                  style: theme.textStyles.titleSmall!.copyWith(
                    color: !isNewSelected
                        ? theme.colors.typography500
                        : theme.colors.grey400,
                    fontWeight: !isNewSelected
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
