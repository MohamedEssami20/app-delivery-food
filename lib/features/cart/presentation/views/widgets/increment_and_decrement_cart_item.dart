import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class IcrementAndDecrementCartItem extends StatelessWidget {
  const IcrementAndDecrementCartItem({
    super.key,
    required this.productQuantity,
  });
  final int productQuantity;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Row(
      spacing: 12,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
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
        ),
        Text(
          "$productQuantity",
          style: theme.textStyles.bodyMedium!.copyWith(
            color: theme.colors.typography500,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colors.primary600,
            ),
            child: Icon(Icons.add, color: theme.colors.white),
          ),
        ),
      ],
    );
  }
}
