import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class LatestSearchItem extends StatelessWidget {
  const LatestSearchItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: AppThemeHelper(context).textStyles.titleLarge?.copyWith(
            color: AppThemeHelper(context).colors.typography500,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.close,
            color: AppThemeHelper(context).colors.typography500,
          ),
        ),
      ],
    );
  }
}
