import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../login_view.dart';

class YouHaveAccountLoginIn extends StatelessWidget {
  const YouHaveAccountLoginIn({
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
          "You have an account? ",
          style: theme.textStyles.titleSmall?.copyWith(
            color: theme.colors.typography400,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, LoginView.routeName);
          },
          child: Text(
            "Log in",
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
