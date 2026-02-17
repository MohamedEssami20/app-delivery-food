import 'package:flutter/material.dart';

import '../helper/app_theme_helper.dart';

Widget buildOrderTimelineContent(
  int index,
  AppThemeHelper theme,
  bool isActive,
) {
  final activeColor = theme.colors.typography500;
  final inactiveColor = theme.colors.grey300;

  switch (index) {
    case 0:
      return Text(
        "Preparing your order",
        style: theme.textStyles.titleMedium?.copyWith(
          color: isActive ? activeColor : inactiveColor,
        ),
      );

    case 1:
      return Text(
        "Your order is on the way",
        style: theme.textStyles.titleSmall?.copyWith(
          color: isActive ? activeColor : inactiveColor,
        ),
      );

    case 2:
      return Text(
        "Your order has been delivered",
        style: theme.textStyles.titleSmall?.copyWith(
          color: isActive ? activeColor : inactiveColor,
        ),
      );

    default:
      return const SizedBox();
  }
}
