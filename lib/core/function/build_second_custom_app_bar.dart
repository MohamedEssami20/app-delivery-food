import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/app_theme_helper.dart';

AppBar buildSecondCustomAppBar({
  required AppThemeHelper theme,
  required String title,
  required String titleIcon,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: theme.colors.grey0,
    elevation: 0,
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        SvgPicture.asset(
          titleIcon,
          alignment: Alignment.center,
          colorFilter: ColorFilter.mode(theme.colors.black, BlendMode.srcIn),
        ),
        Text(
          title,
          style: theme.textStyles.headlineLarge?.copyWith(
            color: theme.colors.typography500,
          ),
        ),
      ],
    ),
  );
}
