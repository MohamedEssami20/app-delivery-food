import 'package:app_delivey_food/core/function/build_home_app_bar.dart';
import 'package:app_delivey_food/core/function/get_current_user.dart';
import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/helper/get_dummy_user_entity.dart';
import 'package:app_delivey_food/features/home/presentation/manager/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BuildUserHomeBarBuilder extends StatelessWidget {
  const BuildUserHomeBarBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return buildHomeAppBar(theme, state.userEntity);
        } else if (state is GetUserError) {
          return buildHomeAppBar(theme, getCurrentUser());
        } else {
          return Skeletonizer(
            child: buildHomeAppBar(theme, getDummyUserEntity()),
          );
        }
      },
    );
  }
}
