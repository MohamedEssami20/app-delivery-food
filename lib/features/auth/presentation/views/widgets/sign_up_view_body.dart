
import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:app_delivey_food/core/utils/error_snackbar.dart';
import 'package:app_delivey_food/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/function/global_validation_email.dart';
import '../../../../../core/utils/custom_button.dart';
import 'builder/signup_button_builder.dart';
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
                    userName = value;
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
                    return globalValidtaionEmail(value);
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
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (isCheck == false) {
                    buildErrorSnackbar(
                      message: "Please agree to the terms and conditions",
                      theme: theme,
                      context: context,
                    );
                  } else {
                    formKey.currentState!.save();
                    BlocProvider.of<SignupCubit>(context).signUpUser(
                      email: email!,
                      password: password!,
                      name: userName!,
                    );
                  }
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              backgroundColor: theme.colors.primary600,
              child: SignupButtonBlocBuilder(),
            ),
          ),
          YouHaveAccountLoginIn(theme: theme),
        ],
      ),
    );
  }
}
