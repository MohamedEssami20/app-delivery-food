import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/features/search/presentation/manager/home_search_mode_cubit/home_search_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Widget buildSearchHomeAppBar({
  required BuildContext context,
  required AppThemeHelper theme,
  TextEditingController? controller,
  VoidCallback? onBackPress,
}) {
  return Row(
    spacing: MediaQuery.sizeOf(context).width * 0.27,
    children: [
      IconButton(
        onPressed:
            onBackPress ??
            () {
              context.read<HomeSearchModeCubit>().changeNormalMode();
              if (controller != null) controller.clear();
            },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      Text(
        "Search",
        style: theme.textStyles.headlineLarge!.copyWith(
          color: theme.colors.typography500,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
