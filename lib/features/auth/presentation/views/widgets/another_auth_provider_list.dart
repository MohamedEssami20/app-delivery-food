import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';
import 'another_auth_provider_item.dart';

class AnotherAuthProviderList extends StatelessWidget {
  const AnotherAuthProviderList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Or",
          textAlign: TextAlign.center,
          style: theme.textStyles.titleLarge!.copyWith(
            color: theme.colors.typography400,
          ),
        ),
        Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnotherAuthProviderItem(Assets.assetsIconsGoogleIcon),
            AnotherAuthProviderItem(Assets.assetsIconsFacebookIcon),
          ],
        ),
      ],
    );
  }
}