import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../sign_up_view.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
    required this.theme,
  });

  final AppThemeHelper theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: theme.textStyles.titleSmall?.copyWith(
            color: theme.colors.typography400,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpView.routeName);
          },
          child: Text(
            "Sign up",
            style: theme.textStyles.titleMedium?.copyWith(
              color: theme.colors.typography500,
              decoration: TextDecoration.underline,
              decorationColor: theme.colors.primary700,
            ),
          ),
        ),
      ],
    );
  }
}