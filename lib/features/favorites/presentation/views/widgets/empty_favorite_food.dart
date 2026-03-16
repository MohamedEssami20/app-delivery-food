import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/cubit/cubit/bottom_naviagtion_bar_cubit.dart';
import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/custom_button.dart';

class EmptyFavoriteFood extends StatelessWidget {
  const EmptyFavoriteFood({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Column(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.assetsImagesCartEmptyImage),
        Text(
          "Nothing found here!",
          style: theme.textStyles.displayLarge!.copyWith(
            color: theme.colors.typography500,
          ),
        ),
        Wrap(
          children: [
            Text(
              "Explore and add items to the cart to show them here......",
              style: AppThemeHelper(context).textStyles.headlineSmall!.copyWith(
                color: AppThemeHelper(context).colors.grey400,
              ),
            ),
          ],
        ),
        CustomButton(
          label: "Explore",
          backgroundColor: theme.colors.primary600,
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          onPressed: () {
            context.read<BottomNavigtionBarCubit>().changeIndex(1);
          },
        ),
      ],
    );
  }
}
