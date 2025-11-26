import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import 'increment_and_decrement_item.dart';

class ProductNameAndCounter extends StatelessWidget {
  const ProductNameAndCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "Pepperoni Cheese Pizza",
            style: theme.textStyles.headlineMedium!.copyWith(
              color: theme.colors.typography500,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            border: Border.all(color: theme.colors.grey200, width: 1.2),
            borderRadius: BorderRadius.circular(50),
            color: theme.colors.white,
          ),
          child: Row(
            spacing: 12,
            children: [
              IncrementAndDecremntItem(iconData: Icons.remove),
              Text("1", style: theme.textStyles.bodyMedium),
              IncrementAndDecremntItem(iconData: Icons.add),
            ],
          ),
        ),
      ],
    );
  }
}