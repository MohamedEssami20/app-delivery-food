import 'package:flutter/material.dart';
import '../helper/app_theme_helper.dart';

Widget buildPaymentItem({
  required BuildContext context,
  required String title,
  required VoidCallback onTap,
}) {
  final theme = AppThemeHelper(context);
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(color: theme.colors.grey50, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 32,
            decoration: BoxDecoration(color: theme.colors.grey200, borderRadius: BorderRadius.circular(4)),
            child: Icon(Icons.credit_card, color: theme.colors.typography400, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: theme.textStyles.titleMedium!.copyWith(color: theme.colors.typography500))),
          Icon(Icons.arrow_forward_ios, color: theme.colors.grey400, size: 16),
        ],
      ),
    ),
  );
}
