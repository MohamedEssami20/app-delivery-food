import 'package:app_delivey_food/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helper/app_theme_helper.dart';
import 'error_snackbar.dart';
import 'success_snackbar.dart';

class PaymentListener extends StatelessWidget {
  const PaymentListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          buildSuccessSnackbar(
            message: "save order successfully",
            theme: AppThemeHelper(context),
            context: context,
          );
        }
        if (state is AddOrderError) {
          buildErrorSnackbar(
            message: "save order failed",
            theme: AppThemeHelper(context),
            context: context,
          );
        }
      },
      child: child,
    );
  }
}
