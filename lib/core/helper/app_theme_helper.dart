import 'package:app_delivey_food/core/utils/app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeHelper {
  final BuildContext context;

  AppThemeHelper(this.context);

  // access to all color of app;
  AppThemeColors  get colors => Theme.of(context).extension<AppThemeColors>()!;

  // access to all text styles of app;
  TextTheme get textStyles => Theme.of(context).textTheme;
}
