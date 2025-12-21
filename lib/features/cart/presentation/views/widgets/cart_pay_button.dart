import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/custom_button.dart';

class CartPayButton extends StatelessWidget {
  const CartPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            "\$ 20.00",
            style: theme.textStyles.displaySmall!.copyWith(
              color: theme.colors.typography500,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: CustomButton(
            padding: EdgeInsetsDirectional.symmetric(vertical: 12),
            label: "Proceed to pay",
            backgroundColor: theme.colors.primary600,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}