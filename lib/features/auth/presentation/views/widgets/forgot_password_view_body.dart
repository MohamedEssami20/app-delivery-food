import 'dart:developer';

import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/custom_button.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:app_delivey_food/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email;
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
            "Forgot your password",
            style: theme.textStyles.displayLarge?.copyWith(
              color: theme.colors.typography500,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "please enter your email address to receive a link to create a new password via email",
            style: theme.textStyles.titleMedium?.copyWith(
              color: theme.colors.typography200,
            ),
          ),
          Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                CustomTextFormFiled(
                  hintText: "email address",
                  textInputType: TextInputType.emailAddress,
                  onSaved: (value) {
                    email = value;
                  },
                  validator: (value) {
                    final RegExp emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 0),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              label: "Forgot Password",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  log("form is valid");
                  formKey.currentState!.save();
                  // send email link to reset password;
                  // navigate to login;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginView.routeName,
                    (route) => false,
                  );
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              backgroundColor: theme.colors.primary600,
            ),
          ),
        ],
      ),
    );
  }
}
