import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class IcrementAndDecrementCartItem extends StatefulWidget {
  const IcrementAndDecrementCartItem({super.key});

  @override
  State<IcrementAndDecrementCartItem> createState() =>
      _IcrementAndDecrementCartItemState();
}

class _IcrementAndDecrementCartItemState
    extends State<IcrementAndDecrementCartItem> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Row(
      spacing: 12,
      children: [
        GestureDetector(
          onTap: () {
            if (count > 1 && count != 0) {
              setState(() => count--);
            }
          },
          child: Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colors.primary600,
            ),
            child: Icon(
              count == 1 ? Icons.delete_outline : Icons.remove,
              color: theme.colors.white,
            ),
          ),
        ),
        Text(
          "$count",
          style: theme.textStyles.bodyMedium!.copyWith(
            color: theme.colors.typography500,
          ),
        ),
        GestureDetector(
          onTap: () => setState(() => count++),
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
