import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';

class OrderPlacedHeader extends StatelessWidget {
  const OrderPlacedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppThemeHelper(context).colors.primary500,
              ),
              alignment: Alignment.center,
              child: Center(
                child: SvgPicture.asset(Assets.assetsIconsCheckIcon),
              ),
            ),
          ],
        ),
        Text(
          "Yay! Your order has been placed.",
          style: theme.textStyles.displayMedium!.copyWith(
            color: theme.colors.typography500,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Your order would be delivered in the 30 mins atmost",
          style: theme.textStyles.titleSmall!.copyWith(
            color: theme.colors.typography400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
