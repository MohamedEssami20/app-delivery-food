import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';
import 'product_rating_and_calory_item.dart';

class ProductRatingAndCalorey extends StatelessWidget {
  const ProductRatingAndCalorey({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppThemeHelper(context).colors.grey0,
        border: Border.all(color: theme.colors.grey200, width: 1.2),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProductRatingAndCaloreyItem(
            icon: Assets.assetsIconsRatingIcon,
            title: "4.8",
            showDivider: false,
          ),

          ProductRatingAndCaloreyItem(
            icon: Assets.assetsIconsCaloryIcon,
            title: "400 Kcal",
            showDivider: true,
          ),
          ProductRatingAndCaloreyItem(
            icon: Assets.assetsIconsTimeIcon,
            title: "30 min",
            showDivider: true,
          ),
        ],
      ),
    );
  }
}
