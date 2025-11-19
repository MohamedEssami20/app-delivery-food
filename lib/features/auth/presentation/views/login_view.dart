import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/function/build_custom_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login_view';
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Scaffold(
      backgroundColor: theme.colors.white,
      appBar: buildCustomAppBar(
        theme: theme,
        showBackButton: false,
        context: context,
      ),
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
