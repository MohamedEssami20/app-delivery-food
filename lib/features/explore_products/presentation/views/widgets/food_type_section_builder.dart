import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/change_food_type_cubit/change_food_type_cubit.dart';
import 'dessert_food_section.dart';
import 'fast_food_section.dart';
import 'food_type_section.dart';
import 'indian_food_section.dart';
import 'sea_food_section.dart';

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
          child: buildFoodTypeSection(state: state),
        );
      },
    );
  }

  Widget buildFoodTypeSection({required ChangeFoodTypeState state}) {
    if (state is IndianFoodChanged && state.isIndianFoodSelected) {
      return IndianFoodSection();
    } else if (state is DessertFoodChanged && state.isDessertFoodSelected) {
      return DessertFoodSection();
    } else if (state is FastFoodChanged && state.isFastFoodSelected) {
      return FastFoodSection();
    } else if (state is SeaFoodChanged && state.isSeaFoodSelected) {
      return SeaFoodSection();
    } else {
      return FoodTypeSection();
    }
  }
}