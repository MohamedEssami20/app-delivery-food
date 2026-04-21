import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/custom_button.dart';

class MyOrderEmptyView extends StatelessWidget {
  const MyOrderEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.assetsImagesCartEmptyImage),
        Text(
          "There are no orders!",
          style: AppThemeHelper(context).textStyles.displayLarge!.copyWith(
            color: AppThemeHelper(context).colors.typography500,
          ),
        ),
        Wrap(
          children: [
            Text(
              "Place order to show here. Previous orders will be shown here as well.",
              style: AppThemeHelper(context).textStyles.headlineSmall!.copyWith(
                color: AppThemeHelper(context).colors.grey400,
              ),
            ),
          ],
        ),
        CustomButton(
          backgroundColor: AppThemeHelper(context).colors.primary600,
          label: "My cart",
          onPressed: () {},
        ),
      ],
    );
  }
}
