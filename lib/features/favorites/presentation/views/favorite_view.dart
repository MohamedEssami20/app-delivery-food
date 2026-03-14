import 'package:flutter/material.dart';

import '../../../../core/function/build_second_custom_app_bar.dart';
import '../../../../core/helper/app_theme_helper.dart' show AppThemeHelper;
import '../../../../core/utils/assets.dart';
import 'widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key,});
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Scaffold(
      backgroundColor: theme.colors.grey0,
      appBar: buildSecondCustomAppBar(
        theme: theme,
        context: context,
        title: "Favorites",
        titleIcon: Assets.assetsIconsFavoriteNavigatioinIcon,
      ),
      body: const FavoriteViewBody(),
    );
  }
}
