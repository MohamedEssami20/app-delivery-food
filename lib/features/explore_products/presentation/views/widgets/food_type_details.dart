import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import 'increment_and_decrement_count.dart';

class FoodTypeDetails extends StatelessWidget {
  const FoodTypeDetails({
    super.key,
    required this.theme,
    required this.productEntity,
  });

  final AppThemeHelper theme;
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            productEntity.name,
            style: theme.textStyles.titleSmall!.copyWith(
              color: theme.colors.typography500,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            spacing: 12,
            children: [
              Text(
                "\$ ${productEntity.price}",
                style: theme.textStyles.bodyLarge!.copyWith(
                  color: theme.colors.typography500,
                ),
              ),
              Visibility(
                visible: productEntity.discount > 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: theme.colors.grey200,
                  ),
                  child: Text(
                    "${productEntity.discount} % Off",
                    style: theme.textStyles.titleSmall!.copyWith(
                      color: theme.colors.typography400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          IcrementAndDecrement(),
        ],
      ),
    );
  }
}
