import 'package:app_delivey_food/core/function/build_custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';
import 'widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const String routeName = 'forgot_password_view';
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Scaffold(
      appBar: buildCustomAppBar(theme: theme, context: context, showBackButton: true),
      body: SafeArea(child: const ForgotPasswordViewBody()),
      );
  }
}