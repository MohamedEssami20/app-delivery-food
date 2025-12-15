import 'package:app_delivey_food/core/utils/food_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/change_food_type_cubit/change_food_type_cubit.dart';
import 'food_type_section.dart';
import 'selected_food_category_section.dart';

class FoodTypeSectionBuilder extends StatelessWidget {
  const FoodTypeSectionBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeFoodTypeCubit, ChangeFoodTypeState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          switchInCurve: Curves.easeOutBack,
          switchOutCurve: Curves.easeInBack,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.95, end: 1.0).animate(animation),
                child: child,
              ),
            );
          },
          child: state.selectedCategory == FoodCategory.none
              ? FoodTypeSection()
              : SelectedFoodCategorySection(),
        );
      },
    );
  }
}
