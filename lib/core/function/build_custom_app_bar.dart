import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/app_theme_helper.dart';
import '../utils/assets.dart';

AppBar buildCustomAppBar({
  required AppThemeHelper theme,
  bool? showBackButton,
  bool? showActionButton,
  bool? showTitle,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: theme.colors.grey0,
    elevation: 0,
    centerTitle: true,
    title: Visibility(
      visible: showTitle ?? false,
      child: SvgPicture.asset(
        Assets.assetsImagesLogoText,
        alignment: Alignment.center,
      ),
    ),
    leadingWidth: 90,
    leading: Visibility(
      visible: showBackButton ?? false,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: theme.colors.grey500,
                size: 20,
              ),
            ),
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
    actions: [
      Visibility(
        visible: showActionButton ?? false,
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            spacing: 16,
            children: [
              SvgPicture.asset(
                Assets.assetsIconsExportIcon,
                colorFilter: ColorFilter.mode(
                  theme.colors.grey500,
                  BlendMode.srcIn,
                ),
              ),
              SvgPicture.asset(Assets.assetsIconsFavoriteNavigatioinIcon),
            ],
          ),
        ),
      ),
    ],
  );
}
