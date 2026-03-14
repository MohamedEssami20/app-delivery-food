import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/error_snackbar.dart';
import '../../../../home/presentation/views/main_view.dart';
import '../../manager/cancel_order_state/cancel_order_cubit.dart';

class CancelOrderButtonBuilder extends StatelessWidget {
  const CancelOrderButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocConsumer<CancelOrderCubit, CancelOrderState>(
      builder: (context, state) {
        if (state is CancelOrderLoading) {
          return CircularProgressIndicator(color: theme.colors.white);
        } else {
          return Text(
            "Cancel order",
            style: theme.textStyles.headlineSmall?.copyWith(
              color: theme.colors.white,
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is CancelOrderSuccess) {
          buildErrorSnackbar(
            message: "Cancel order successfully",
            theme: theme,
            context: context,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainView.routeName,
            (_) => false,
          );
        }
        if (state is CancelOrderError) {
          buildErrorSnackbar(
            message: "Cancel order error, try later",
            theme: theme,
            context: context,
          );
        }
      },
    );
  }
}