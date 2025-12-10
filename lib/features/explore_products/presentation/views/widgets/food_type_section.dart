import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../manager/change_food_type_cubit/change_food_type_cubit.dart';

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
              context.read<ChangeFoodTypeCubit>().changeIndianFoodSelected();
            },
          ),
          FoodImageTypeItem(
            image: Assets.assetsImagesDessertFood,
            onTap: () {
              context.read<ChangeFoodTypeCubit>().changeDessertFoodSelected();
            },
          ),
          FoodImageTypeItem(
            image: Assets.assetsImagesFastFood,
            onTap: () {
              context.read<ChangeFoodTypeCubit>().changeFastFoodSelected();
            },
          ),
          FoodImageTypeItem(
            image: Assets.assetsImagesSeaFood,
            onTap: () {
              context.read<ChangeFoodTypeCubit>().changeSeaFoodSelected();
            },
          ),
        ],
      ),
    );
  }
}

class FoodImageTypeItem extends StatelessWidget {
  const FoodImageTypeItem({
    super.key,
    required this.image,
    required this.onTap,
  });

  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(image, fit: BoxFit.fitWidth, width: double.infinity),
    );
  }
}
