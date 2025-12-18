  import 'package:app_delivey_food/features/search/presentation/manager/home_search_mode_cubit/home_search_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/search/presentation/manager/search_products_cubit/search_products_cubit.dart';

void onChangeActionInHomeView(String value, BuildContext context) {
    if (value.isNotEmpty && value.trim().isNotEmpty) {
      context.read<HomeSearchModeCubit>().changeSearchMode();
      context.read<SearchProductsCubit>().getSearchProducts(
        query: value.trim(),
      );
    } else {
      context
          .read<HomeSearchModeCubit>()
          .changeLatestSearchedMode();
      context.read<SearchProductsCubit>().getSearchQuery();
    }
  }