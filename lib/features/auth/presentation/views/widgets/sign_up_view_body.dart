import 'dart:developer';

import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/custom_button.dart';
import 'terms_and_condititon.dart';
import 'you_have_account_login.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isSecure = false;
  String? email, password, userName;
  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          SizedBox(height: 10),
          Text(
            "Create a new account",
            style: theme.textStyles.displayLarge?.copyWith(
              color: theme.colors.typography500,
            ),
          ),
          const SizedBox(height: 10),
          Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                CustomTextFormFiled(
                  hintText: "user name",
                  textInputType: TextInputType.text,
                  onSaved: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your user name';
                    }
                    return null;
                  },
                ),
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
          TermsAndCondititonCheckBox(
            theme: theme,
            isChecked: isCheck,
            onChanged: (value) {
              setState(() {
                isCheck = value;
              });
            },
          ),
          const SizedBox(height: 0),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              label: "Create account",
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
          YouHaveAccountLoginIn(theme: theme),
        ],
      ),
    );
  }
}
