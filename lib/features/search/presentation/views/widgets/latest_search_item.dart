import 'package:app_delivey_food/features/search/presentation/manager/explore_search_input_cubit/explore_search_input_cubit.dart';
import 'package:app_delivey_food/features/search/presentation/manager/home_search_input_cubit/search_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/app_theme_helper.dart';
//import '../../manager/home_search_mode_cubit/home_search_mode_cubit.dart';
import '../../../../../core/utils/explore_search_mode.dart';
import '../../../../../core/utils/home_search_mode.dart';
import '../../manager/explore_search_mode/explore_search_mode_cubit.dart';
import '../../manager/home_search_mode_cubit/home_search_mode_cubit.dart';
import '../../manager/search_products_cubit/search_products_cubit.dart';

class LatestSearchItem extends StatelessWidget {
  const LatestSearchItem({
    super.key,
    required this.text,
    required this.homeSearchMode,
    required this.exploreSearchMode,
  });
  final String text;
  final HomeSearchMode homeSearchMode;
  final ExploreSearchMode exploreSearchMode;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (homeSearchMode == HomeSearchMode.latestSearched) {
              context.read<HomeSearchInputCubit>().setSearchInput(text.trim());
              context.read<HomeSearchModeCubit>().changeSearchMode();
              context.read<SearchProductsCubit>().getSearchProducts(
                query: text.trim(),
              );
            }
            if (exploreSearchMode == ExploreSearchMode.latest) {
              context.read<ExploreSearchInputCubit>().setSearchInput(
                text.trim(),
              );
              context.read<ExploreSearchModeCubit>().changeExploreSearchMode();
              context.read<SearchProductsCubit>().getSearchProducts(
                query: text.trim(),
              );
            }
          },
          child: Text(
            text,
            style: AppThemeHelper(context).textStyles.titleLarge?.copyWith(
              color: AppThemeHelper(context).colors.typography500,
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            context.read<SearchProductsCubit>().deleteSearchQuery(query: text);
          },
          child: Icon(
            Icons.close,
            color: AppThemeHelper(context).colors.typography500,
          ),
        ),
      ],
    );
  }
}
