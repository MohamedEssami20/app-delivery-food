import 'package:flutter/material.dart';

import '../helper/app_theme_helper.dart';

buildErrorSnackbar({
  required String message,
  required AppThemeHelper theme,
  required BuildContext context,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: theme.colors.primary600,
      duration: Duration(seconds: 2),
      elevation: 1.5,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      // width: double.infinity,
      content: Text(
        message,
        style: theme.textStyles.headlineSmall!.copyWith(color: Colors.white),
      ),
    ),
  );
}
