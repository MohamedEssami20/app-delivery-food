import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/custom_button.dart';
import 'package:flutter/material.dart';

class ProductPriceAndAddToCart extends StatelessWidget {
  const ProductPriceAndAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      spacing: 50,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$9.99",
          style: theme.textStyles.displaySmall!.copyWith(
            color: theme.colors.typography500,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: CustomButton(
              label: "Add to cart",
              backgroundColor: theme.colors.primary600,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
