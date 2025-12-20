import 'package:app_delivey_food/core/utils/food_category.dart';
import 'package:app_delivey_food/core/utils/home_search_mode.dart';
import 'package:app_delivey_food/features/explore_products/presentation/views/widgets/food_type_section.dart';
import 'package:app_delivey_food/features/explore_products/presentation/views/widgets/selected_food_category_builder.dart';
import 'package:app_delivey_food/features/search/presentation/manager/explore_search_mode/explore_search_mode_cubit.dart';
import 'package:app_delivey_food/features/search/presentation/views/latest_serach_view.dart';
import 'package:app_delivey_food/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/explore_search_mode.dart';
import '../../manager/change_food_type_cubit/change_food_type_cubit.dart';

class FoodTypeSectionBuilder extends StatelessWidget {
  const FoodTypeSectionBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreSearchModeCubit, ExploreSearchMode>(
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
    required ExploreSearchMode searchState,
  }) {
    final category = changeFoodTypeState.selectedCategory;

    if (searchState == ExploreSearchMode.searching) {
      return const SearchView();
    }

    if (searchState == ExploreSearchMode.latest) {
      return const LatestSerachView(
        homeSearchMode: HomeSearchMode.normal,
        exploreSearchMode: ExploreSearchMode.latest,
      );
    }

    if (category != FoodCategory.none) {
      return SelectedFoodCategoryBuilder();
    }

    return const FoodTypeSection();
  }
}
