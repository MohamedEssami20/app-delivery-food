import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class TermsAndCondititonCheckBox extends StatelessWidget {
  const TermsAndCondititonCheckBox({
    super.key,
    required this.theme,
    required this.onChanged,
    this.isChecked,
  });

  final AppThemeHelper theme;
  final Function(bool? value) onChanged;
  final bool? isChecked;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: theme.colors.primary600,
          checkColor: theme.colors.white,
          side: BorderSide(
            width: 1,
            color: isChecked == true
                ? theme.colors.primary600
                : theme.colors.typography400,
          ),
          value: isChecked,
          onChanged: onChanged,
        ),
        Text(
          "I agree to the terms and conditions",
          style: theme.textStyles.titleSmall?.copyWith(
            color: theme.colors.typography400,
          ),
        ),
      ],
    );
  }
}
