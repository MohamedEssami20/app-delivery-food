import 'package:app_delivey_food/core/utils/success_snackbar.dart';
import 'package:app_delivey_food/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/error_snackbar.dart';
import 'app_theme_helper.dart';

class CartStateListener extends StatelessWidget {
  const CartStateListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is RemoveProductFromCartSuccess) {
          buildSuccessSnackbar(
            message: "Product removed from cart",
            theme: theme,
            context: context,
          );
        } else if (state is AddProductToCartSuccess) {
          buildSuccessSnackbar(
            message: "Product added to cart",
            theme: theme,
            context: context,
          );
        } else if (state is AddProductToCartError) {
          buildErrorSnackbar(
            message: state.errorMessage,
            theme: theme,
            context: context,
          );
        }
        if (state is RemoveProductFromCartError) {
          buildErrorSnackbar(
            message: state.errorMessage,
            theme: theme,
            context: context,
          );
        }
      },
      child: child,
    );
  }
}
