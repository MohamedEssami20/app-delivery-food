import 'package:app_delivey_food/core/function/build_custom_app_bar.dart';
import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName='signUpView';
  @override
  Widget build(BuildContext context) {
    final theme=AppThemeHelper(context);
    return Scaffold(
      appBar: buildCustomAppBar(theme: theme, showBackButton: true, context: context),
      body: SignUpViewBody(),
    );
  }
}