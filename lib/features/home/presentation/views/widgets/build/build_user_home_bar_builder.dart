import 'package:app_delivey_food/core/function/build_home_app_bar.dart';
import 'package:app_delivey_food/core/function/get_current_user.dart';
import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/helper/get_dummy_user_entity.dart';
import 'package:app_delivey_food/core/utils/build_search_home_appbar.dart';
import 'package:app_delivey_food/features/home/presentation/manager/user_cubit/user_cubit.dart';
import 'package:app_delivey_food/features/search/presentation/manager/home_search_mode_cubit/home_search_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/utils/home_search_mode.dart';

class BuildUserHomeBarBuilder extends StatelessWidget {
  const BuildUserHomeBarBuilder({super.key, required this.searchController});
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocBuilder<HomeSearchModeCubit, HomeSearchMode>(
      builder: (context, state) {
        if (state == HomeSearchMode.searching ||
            state == HomeSearchMode.latestSearched) {
          return buildSearchHomeAppBar(
            context: context,
            theme: theme,
            controller: searchController,
          );
        } else {
          return BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is GetUserSuccess) {
                return buildNormalHomeAppBar(theme, state.userEntity);
              } else if (state is GetUserError) {
                return buildNormalHomeAppBar(theme, getCurrentUser());
              } else {
                return Skeletonizer(
                  child: buildNormalHomeAppBar(theme, getDummyUserEntity()),
                );
              }
            },
          );
        }
      },
    );
  }
}
