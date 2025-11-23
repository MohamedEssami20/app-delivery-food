import 'package:app_delivey_food/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/error_snackbar.dart';
import '../../../../../core/utils/success_snackbar.dart';
import '../../../../home/presentation/views/home_view.dart';
import 'another_auth_provider_item.dart';

class AnotherAuthProviderList extends StatelessWidget {
  const AnotherAuthProviderList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Or",
          textAlign: TextAlign.center,
          style: theme.textStyles.titleLarge!.copyWith(
            color: theme.colors.typography400,
          ),
        ),
        Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () =>
                  BlocProvider.of<LoginCubit>(context).loginUserWithGoogle(),
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LogInWithGoogleSuccessState) {
                    Navigator.pushReplacementNamed(context, HomeView.routeName);
                    buildSuccessSnackbar(
                      message: "Sign up Successfuly",
                      theme: theme,
                      context: context,
                    );
                  }

                  if (state is LogInWithGoogleFailureState) {
                    buildErrorSnackbar(
                      message: state.errorMessage,
                      theme: theme,
                      context: context,
                    );
                  }

                  if (state is LogInWithGoogleLoadingState) {
                    CircularProgressIndicator(color: theme.colors.primary600);
                  }
                },
                builder: (context, state) {
                  return AnotherAuthProviderItem(Assets.assetsIconsGoogleIcon);
                },
              ),
            ),
            AnotherAuthProviderItem(Assets.assetsIconsFacebookIcon),
          ],
        ),
      ],
    );
  }
}
