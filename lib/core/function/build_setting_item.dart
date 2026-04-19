import 'package:flutter/material.dart';
import '../helper/app_theme_helper.dart';

Widget buildSettingItem({
  required BuildContext context,
  required IconData icon,
  required String title,
  String? trailingText,
  required VoidCallback onTap,
}) {
  final theme = AppThemeHelper(context);
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(color: theme.colors.grey50, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(icon, color: theme.colors.typography500, size: 22),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: theme.textStyles.titleMedium!.copyWith(color: theme.colors.typography500))),
          if (trailingText != null) ...[
            Text(trailingText, style: theme.textStyles.titleSmall!.copyWith(color: theme.colors.typography400)),
            const SizedBox(width: 8),
          ],
          Icon(Icons.arrow_forward_ios, color: theme.colors.grey400, size: 16),
        ],
      ),
    ),
  );
}
