import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:flutter/material.dart';

Widget buildHomeAppBar(AppThemeHelper theme) {
  return ListTile(
    title: Text(
      'Hi John',
      style: theme.textStyles.titleSmall!.copyWith(
        color: theme.colors.typography500,
      ),
    ),
    trailing: CircleAvatar(
      // radius: 40,
      child: Image.asset(Assets.assetsImagesProfileImage, fit: BoxFit.fill),
    ),
    subtitle: Text(
      "What are you carving?",
      style: theme.textStyles.titleSmall!.copyWith(
        color: theme.colors.typography400,
      ),
    ),
  );
}
