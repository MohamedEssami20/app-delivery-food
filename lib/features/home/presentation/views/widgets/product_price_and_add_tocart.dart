import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/custom_button.dart';
import 'package:flutter/material.dart';
class ProductPriceAndAddToCart extends StatelessWidget {
  const ProductPriceAndAddToCart({super.key, required this.productEntity, this.onPressed});
  final ProductEntity productEntity;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      spacing: 50,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$ ${productEntity.price}",
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
              onPressed: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
