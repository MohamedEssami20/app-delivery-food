import 'package:app_delivey_food/core/utils/food_category.dart';
import 'package:app_delivey_food/features/explore_products/presentation/views/widgets/selected_food_category_builder.dart';
import 'package:app_delivey_food/features/search/presentation/manager/search_mode_cubit/search_mode_cubit.dart';
import 'package:app_delivey_food/features/search/presentation/views/latest_serach_view.dart';
import 'package:app_delivey_food/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/change_food_type_cubit/change_food_type_cubit.dart';
import 'food_type_section.dart';

class FoodTypeSectionBuilder extends StatelessWidget {
  const FoodTypeSectionBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchModeCubit, SearchModeState>(
      builder: (context, searchState) {
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
                    scale: Tween<double>(
                      begin: 0.95,
                      end: 1.0,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: buildCategorySection(
                changeFoodTypeState: state,
                searchState: searchState,
              ),
            );
          },
        );
      },
    );
  }

  Widget buildCategorySection({
    required ChangeFoodTypeState changeFoodTypeState,
    required SearchModeState searchState,
  }) {
    if (changeFoodTypeState.selectedCategory == FoodCategory.none &&
        searchState is ExplorerViewNormalModeChanged) {
      return FoodTypeSection();
    } else if (searchState is ExplorerViewSearchModeChanged &&
        changeFoodTypeState.selectedCategory == FoodCategory.none) {
      return SearchView();
    } else if (changeFoodTypeState.selectedCategory != FoodCategory.none &&
        searchState is ExplorerViewSearchModeChanged) {
      return SearchView();
    } else if (searchState is ExplorerViewLatestSearchedModeChanged &&
        changeFoodTypeState.selectedCategory == FoodCategory.none) {
      return LatestSerachView();
    } else if (changeFoodTypeState.selectedCategory != FoodCategory.none &&
        searchState is ExplorerViewLatestSearchedModeChanged) {
      return LatestSerachView();
    } else {
      return SelectedFoodCategoryBuilder();
    }
  }
}
