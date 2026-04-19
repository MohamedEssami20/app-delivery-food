import 'package:flutter/material.dart';
import '../helper/app_theme_helper.dart';

Widget buildProfileTextField({
  required BuildContext context,
  required TextEditingController controller,
  required String hint,
  TextAlign textAlign = TextAlign.start,
}) {
  final theme = AppThemeHelper(context);
  return TextFormField(
    controller: controller,
    textAlign: textAlign,
    style: theme.textStyles.bodyLarge!.copyWith(color: theme.colors.typography500),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: theme.textStyles.bodyLarge!.copyWith(color: theme.colors.typography300),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      filled: true,
      fillColor: theme.colors.grey0,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: theme.colors.grey200)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: theme.colors.grey200)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: theme.colors.primary600)),
    ),
  );
}
