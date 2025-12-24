import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.assetsImagesCartEmptyImage),
        Text(
          "Your cart is empty!",
          style: AppThemeHelper(context).textStyles.displayLarge!.copyWith(
            color: AppThemeHelper(context).colors.typography500,
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
      ],
    );
  }
}
