import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_theme_helper.dart';
//import '../../manager/home_search_mode_cubit/home_search_mode_cubit.dart';
import '../../manager/search_products_cubit/search_products_cubit.dart';

class LatestSearchItem extends StatelessWidget {
  const LatestSearchItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    //final searchMode = context.read<HomeSearchModeCubit>().state;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            // if (searchMode is LatestSearchedModeChanged &&
            //     searchMode.isLatestSearchedMode) {
            //   context.read<SearchProductsCubit>().getSearchProducts(
            //     query: text.trim(),
            //   );
            //   context.read<SearchModeCubit>().changeSearchMode();
            // } else if (searchMode is ExplorerViewLatestSearchedModeChanged &&
            //     searchMode.isExplorerLatestSearchedMode) {
            //   context.read<SearchProductsCubit>().getSearchProducts(
            //     query: text.trim(),
            //   );
            //   context.read<SearchModeCubit>().changeSearchedExploreMode();
            // }
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
