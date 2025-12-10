import 'package:app_delivey_food/features/explore_products/presentation/views/widgets/back_to_normal_food_type_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helper/app_theme_helper.dart';

class FastFoodSection extends StatelessWidget {
  const FastFoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            BackToNormalFoodTypeView(theme:   theme),
            Text("fast Food"),
          ],
        ),
      ),
    );
  }
}
