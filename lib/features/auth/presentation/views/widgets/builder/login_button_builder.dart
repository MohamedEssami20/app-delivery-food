import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/success_snackbar.dart';
import 'package:app_delivey_food/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:app_delivey_food/features/home/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/error_snackbar.dart';

class LoginButtonBuilder extends StatelessWidget {
  const LoginButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LogInLoadingState) {
          return CircularProgressIndicator(color: theme.colors.white);
        } else {
          return Text(
            "create account",
            style: theme.textStyles.headlineSmall!.copyWith(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w900,
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is LogInSuccessState) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
          buildSuccessSnackbar(
            message: "Sign up Successfuly",
            theme: theme,
            context: context,
          );
        }

        if (state is LogInFailureState) {
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
