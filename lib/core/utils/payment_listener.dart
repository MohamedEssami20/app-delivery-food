import 'package:app_delivey_food/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cart/domain/entities/cart_item_entity.dart';
import '../../features/checkout/presentation/views/order_placed_view.dart';
import '../helper/app_theme_helper.dart';
import 'error_snackbar.dart';
import 'success_snackbar.dart';

class PaymentListener extends StatelessWidget {
  const PaymentListener({
    super.key,
    required this.child,
    required this.cartItemEntity,
  });
  final Widget child;
  final List<CartItemEntity> cartItemEntity;
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
          Navigator.pushNamedAndRemoveUntil(
            context,
            OrderPlacedView.routeName,
            (_) => false,
            arguments: cartItemEntity
                .map((e) => e.calculateTotalPrice())
                .reduce((value, element) => value + element)
                .toString(),
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
