import 'package:app_delivey_food/core/helper/app_theme_helper.dart'
    show AppThemeHelper;
import 'package:flutter/material.dart';

import 'latest_search_item.dart';

class LatestSearchViewBody extends StatelessWidget {
  const LatestSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Row(
          children: [
            Text(
              "Latest Search",
              style: theme.textStyles.titleLarge?.copyWith(
                color: theme.colors.typography500,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Clear",
                style: theme.textStyles.titleMedium?.copyWith(
                  color: theme.colors.typography500,
                ),
              ),
            ),
          ],
        ),
        Column(
          spacing: 12,
          children: List.generate(3, (index) {
            return LatestSearchItem(text: "Pepperoni Cheese Pizza");
          }),
        ),
      ],
    );
  }
}