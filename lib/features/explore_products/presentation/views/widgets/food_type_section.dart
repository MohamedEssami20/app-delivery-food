import 'package:app_delivey_food/core/utils/food_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../manager/change_food_type_cubit/change_food_type_cubit.dart';
import 'food_image_type_item.dart';

class FoodTypeSection extends StatelessWidget {
  const FoodTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 18,
        children: [
          FoodImageTypeItem(
            image: Assets.assetsImagesIndianFood,
            onTap: () {
              context.read<ChangeFoodTypeCubit>().selectCategory(
                FoodCategory.indianFood,
              );
            },
          ),
          FoodImageTypeItem(
            image: Assets.assetsImagesDessertFood,
            onTap: () {
              context.read<ChangeFoodTypeCubit>().selectCategory(
                FoodCategory.desserts,
              );
            },
          ),
          FoodImageTypeItem(
            image: Assets.assetsImagesFastFood,
            onTap: () {
              context.read<ChangeFoodTypeCubit>().selectCategory(
                FoodCategory.fastFood,
              );
            },
          ),
          FoodImageTypeItem(
            image: Assets.assetsImagesSeaFood,
            onTap: () {
              context.read<ChangeFoodTypeCubit>().selectCategory(
                FoodCategory.seaFood,
              );
            },
          ),
        ],
      ),
    );
  }
}
