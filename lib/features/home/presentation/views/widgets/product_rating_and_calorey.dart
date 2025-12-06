import 'package:app_delivey_food/features/home/domain/entities/product_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';
import 'product_rating_and_calory_item.dart';

class ProductRatingAndCalorey extends StatelessWidget {
  const ProductRatingAndCalorey({super.key, required this.product});
  final ProductEntity product;
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
            title: product.avrageRating.toString(),
            showDivider: false,
          ),

          ProductRatingAndCaloreyItem(
            icon: Assets.assetsIconsCaloryIcon,
            title: "${product.calories} Kcal",
            showDivider: true,
          ),
          ProductRatingAndCaloreyItem(
            icon: Assets.assetsIconsTimeIcon,
            title: "${convertTime(product.createdAt)} min",
            showDivider: true,
          ),
        ],
      ),
    );
  }
}

// create method that return time from TimeStamp;

String convertTime(Timestamp time){
  return time.toDate().minute.toString();
}