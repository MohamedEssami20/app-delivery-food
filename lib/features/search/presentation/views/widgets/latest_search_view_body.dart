import 'package:app_delivey_food/core/helper/app_theme_helper.dart'
    show AppThemeHelper;
import 'package:app_delivey_food/core/utils/home_search_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/explore_search_mode.dart';
import '../../manager/search_products_cubit/search_products_cubit.dart';
import 'latest_search_item.dart';

class LatestSearchViewBody extends StatelessWidget {
  const LatestSearchViewBody({super.key, required this.homeSearchMode, required this.exploreSearchMode});
  final HomeSearchMode homeSearchMode;
  final ExploreSearchMode exploreSearchMode;  
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocBuilder<SearchProductsCubit, SearchProductsState>(
      buildWhen: (previous, current) => current is GetSearchQuerySuccess,
      builder: (context, state) {
        if (state is GetSearchQuerySuccess) {
          if (state.query.isEmpty) {
            return Center(
              child: Text(
                "No search query found",
                style: theme.textStyles.headlineSmall!.copyWith(
                  color: theme.colors.typography400,
                ),
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Row(
                children: [
                  Text(
                    "Latest Search",
                    style: theme.textStyles.titleLarge?.copyWith(
                      color: theme.colors.typography500,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.read<SearchProductsCubit>().deleteSearchQuery();
                    },
                    child: Text(
                      "Clear",
                      style: theme.textStyles.titleMedium?.copyWith(
                        color: theme.colors.typography500,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 12,
                children: List.generate(state.query.length, (index) {
                  return LatestSearchItem(text: state.query[index].toString(), homeSearchMode: homeSearchMode, exploreSearchMode: exploreSearchMode);
                }),
              ),
            ],
          );
        } else if (state is GetSearchQueryFailure) {
          return Center(
            child: Text(
              state.errormessage,
              style: theme.textStyles.headlineSmall!.copyWith(
                color: theme.colors.typography400,
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(color: theme.colors.primary600),
          );
        }
      },
    );
  }
}
