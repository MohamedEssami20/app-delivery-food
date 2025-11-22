import 'dart:developer';

import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/custom_button.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../forgot_password_view.dart';
import 'another_auth_provider_list.dart';
import 'dont_have_account.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isSecure = false;
  String? email, password;
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
                CustomTextFormFiled(
                  hintText: "password",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: !isSecure,
                  onSaved: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isSecure = !isSecure;
                      });
                    },
                    icon: Icon(
                      isSecure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: theme.colors.typography400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ForgotPasswordView.routeName);
            },
            child: Text(
              "Forgot your password?",
              style: theme.textStyles.headlineSmall?.copyWith(
                color: theme.colors.primary700,
              ),
            ),
          ),
          const SizedBox(height: 0),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              label: "Log in",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  log("form is valid");
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              backgroundColor: theme.colors.primary600,
            ),
          ),
          const SizedBox(height: 0),
          DontHaveAccount(theme: theme),
          AnotherAuthProviderList(),
        ],
      ),
    );
  }
}
