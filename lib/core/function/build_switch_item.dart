import 'package:flutter/material.dart';
import '../helper/app_theme_helper.dart';

Widget buildSwitchItem({
  required BuildContext context,
  required IconData icon,
  required String title,
  required bool value,
  required ValueChanged<bool> onChanged,
}) {
  final theme = AppThemeHelper(context);
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(color: theme.colors.grey50, borderRadius: BorderRadius.circular(12)),
    child: Row(
      children: [
        Icon(icon, color: theme.colors.typography500, size: 22),
        const SizedBox(width: 16),
        Expanded(child: Text(title, style: theme.textStyles.titleMedium!.copyWith(color: theme.colors.typography500))),
        Switch(value: value, onChanged: onChanged, activeThumbColor: theme.colors.primary600),
      ],
    ),
  );
}
