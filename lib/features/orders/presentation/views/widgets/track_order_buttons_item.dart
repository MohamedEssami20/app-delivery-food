import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class TrackOrderButtonsItem extends StatelessWidget {
  const TrackOrderButtonsItem({
    super.key,
    required this.theme,
    this.onPress,
    required this.title,
  });

  final AppThemeHelper theme;
  final Function()? onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: theme.colors.white,
          borderRadius: BorderRadius.circular(16),
          shape: BoxShape.rectangle,
          border: Border.all(color: theme.colors.grey200, width: 1.2),
        ),
        child: Center(
          child: Text(
            title,
            style: theme.textStyles.headlineSmall?.copyWith(
              color: theme.colors.typography500,
            ),
          ),
        ),
      ),
    );
  }
}
