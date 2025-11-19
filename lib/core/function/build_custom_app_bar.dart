import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/app_theme_helper.dart';
import '../utils/assets.dart';

AppBar buildCustomAppBar(AppThemeHelper theme, [bool? showBackButton]) {
  return AppBar(
    backgroundColor: theme.colors.white,
    elevation: 0,
    centerTitle: true,
    title: SvgPicture.asset(
      Assets.assetsImagesLogoText,
      alignment: Alignment.center,
    ),
    leadingWidth: 100,
    leading: Visibility(
      visible: showBackButton ?? false,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.arrow_back_ios, color: theme.colors.grey500, size: 20),
            Text(
              'Back',
              style: theme.textStyles.headlineSmall?.copyWith(
                color: theme.colors.typography500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
