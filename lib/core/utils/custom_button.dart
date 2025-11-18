import 'package:flutter/material.dart';

import '../helper/app_theme_helper.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.child,
    this.label,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
  });
  final Widget? child;
  final String? label;
  final void Function()? onPressed;
  final Color? backgroundColor, textColor;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: backgroundColor ?? theme.colors.primary600,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child:
          child ??
          Text(
            label!,
            style: theme.textStyles.headlineSmall!.copyWith(
              color: textColor ?? Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w900,
            ),
          ),
    );
  }
}
