import 'package:flutter/material.dart';
import '../helper/app_theme_helper.dart';

Widget buildInfoField({
  required BuildContext context,
  required String label,
  required String value,
}) {
  final theme = AppThemeHelper(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: theme.textStyles.titleSmall!.copyWith(color: theme.colors.typography400)),
      const SizedBox(height: 8),
      Text(value, style: theme.textStyles.titleMedium!.copyWith(color: theme.colors.typography500)),
    ],
  );
}
