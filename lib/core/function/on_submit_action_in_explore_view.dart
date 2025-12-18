import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/search/presentation/manager/explore_search_mode/explore_search_mode_cubit.dart';
import '../../features/search/presentation/manager/search_products_cubit/search_products_cubit.dart';

void onSubmitActionInExploreView(String value, BuildContext context) {
    if (value.isNotEmpty && value.trim().isNotEmpty) {
      context.read<ExploreSearchModeCubit>().changeExploreSearchMode();
      context.read<SearchProductsCubit>().getSearchProducts(
        query: value.trim(),
      );
      context.read<SearchProductsCubit>().storeSearchQuery(
        query: value.trim(),
      );
    }
  }