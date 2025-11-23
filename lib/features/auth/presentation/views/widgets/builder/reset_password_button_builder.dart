import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/success_snackbar.dart';
import 'package:app_delivey_food/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:app_delivey_food/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/error_snackbar.dart';

class ResetPasswordButtonBuilder extends StatelessWidget {
  const ResetPasswordButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        if (state is ResetPasswordInitial || state is ResetPasswordFailureState) {
          return Text(
            "create account",
            style: theme.textStyles.headlineSmall!.copyWith(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w900,
            ),
          );
        } else {
          return CircularProgressIndicator(color: theme.colors.white);
        }
      },
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
          buildSuccessSnackbar(
            message: "we sent you an email to reset your password",
            theme: theme,
            context: context,
          );
        }

        if (state is ResetPasswordFailureState) {
          buildErrorSnackbar(
            message: state.errorMessage,
            theme: theme,
            context: context,
          );
        }
      },
    );
  }
}
