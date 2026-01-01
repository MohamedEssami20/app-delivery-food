  import 'package:flutter/material.dart';

import '../helper/app_theme_helper.dart';

Widget buildOrderTimelineContent(int index, AppThemeHelper theme) {
    switch (index) {
      case 0:
        return Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Preparing your order",
              style: theme.textStyles.titleMedium?.copyWith(
                color: theme.colors.typography500,
              ),
            ),
            Text(
              "We are preparing your food with magic and care",
              style: theme.textStyles.labelSmall?.copyWith(
                color: theme.colors.typography400,
              ),
            ),
            Text(
              "Time Req. 20mins",
              style: theme.textStyles.labelSmall?.copyWith(
                color: theme.colors.typography400,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );

      case 1:
        return Text(
          "Your order is on the way",
          style: theme.textStyles.titleSmall?.copyWith(
            color: theme.colors.grey300,
          ),
        );

      case 2:
        return Text(
          "Your order has been delivered",
          style: theme.textStyles.titleSmall?.copyWith(
            color: theme.colors.grey300,
          ),
        );

      default:
        return const SizedBox();
    }
  }