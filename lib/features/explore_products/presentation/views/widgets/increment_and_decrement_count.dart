import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class IcrementAndDecrement extends StatelessWidget {
  const IcrementAndDecrement({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Row(
      spacing: 12,
      children: [
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colors.primary600,
          ),
          child: Icon(Icons.remove, color: theme.colors.white),
        ),
        Text(
          "1",
          style: theme.textStyles.bodyMedium!.copyWith(
            color: theme.colors.typography500,
          ),
        ),
        Container(
          width: 30,
          height: 30,
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colors.primary600,
          ),
          child: Icon(Icons.add, color: theme.colors.white),
        ),
      ],
    );
  }
}
