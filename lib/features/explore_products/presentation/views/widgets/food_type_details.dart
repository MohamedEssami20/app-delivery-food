import 'package:app_delivey_food/core/utils/custom_button.dart' show CustomButton;
import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class FoodTypeDetails extends StatelessWidget {
  const FoodTypeDetails({
    super.key,
    required this.theme,
  });

  final AppThemeHelper theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            "Pepperoni Cheese Pizza",
            style: theme.textStyles.titleSmall!.copyWith(
              color: theme.colors.typography500,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            spacing: 12,
            children: [
              Text(
                "\$ 8.99",
                style: theme.textStyles.bodyLarge!.copyWith(
                  color: theme.colors.typography500,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: theme.colors.grey200,
                ),
                child: Text(
                  "10 % Off",
                  style: theme.textStyles.titleSmall!.copyWith(
                    color: theme.colors.typography400,
                  ),
                ),
              ),
            ],
          ),
    
          CustomButton(label: "Add to cart", onPressed: () {}),
        ],
      ),
    );
  }
}
