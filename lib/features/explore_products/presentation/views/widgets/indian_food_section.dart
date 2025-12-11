import 'package:app_delivey_food/features/explore_products/presentation/views/widgets/food_type_list.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helper/app_theme_helper.dart';
import 'back_to_normal_food_type_view.dart';

class IndianFoodSection extends StatelessWidget {
  const IndianFoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return SizedBox.expand(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackToNormalFoodTypeView(theme: theme),
            FoodTypeListView(),
          ],
        ),
      ),
    );
  }
}
