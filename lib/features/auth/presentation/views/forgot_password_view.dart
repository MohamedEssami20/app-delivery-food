import 'package:app_delivey_food/core/function/build_custom_app_bar.dart';
import 'package:app_delivey_food/core/services/gei_it_services.dart';
import 'package:app_delivey_food/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../domain/repos/auth_repos.dart';
import 'widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const String routeName = 'forgot_password_view';
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocProvider(
      create: (context) =>
          ResetPasswordCubit(authRepos: GetItService.getIt.get<AuthRepos>()),
      child: Scaffold(
        appBar: buildCustomAppBar(
          theme: theme,
          context: context,
          showBackButton: true,
        ),
        body: SafeArea(child: const ForgotPasswordViewBody()),
      ),
    );
  }
}
