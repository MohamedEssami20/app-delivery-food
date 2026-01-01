import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';
import 'food_to_be_delivered_item.dart';

class FoodTobeDeliveredList extends StatelessWidget {
  const FoodTobeDeliveredList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          "Food to be delivered",
          style: AppThemeHelper(context).textStyles.labelLarge?.copyWith(
            color: AppThemeHelper(context).colors.typography300,
          ),
        ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: const FoodToBeDeliveredItem(
                image: Assets.assetsImagesBurgerProduct,
                quantity: 2,
              ),
            ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}