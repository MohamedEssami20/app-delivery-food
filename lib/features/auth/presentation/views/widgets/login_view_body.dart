import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          SizedBox(height: 0),
          Text(
            "Log in to your account",
            style: theme.textStyles.displayLarge?.copyWith(
              color: theme.colors.typography500,
            ),
          ),
          const SizedBox(height: 5),
          CustomTextFormFiled(
            hintText: "email address",
            textInputType: TextInputType.emailAddress,
          ),
          CustomTextFormFiled(
            hintText: "password",
            textInputType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}
