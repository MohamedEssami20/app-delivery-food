import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../features/cart/domain/entities/cart_item_entity.dart';
import '../../features/checkout/domain/entities/address_input_entity.dart';
import '../../features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import '../helper/app_theme_helper.dart';
import '../utils/app_keys.dart';
import '../utils/error_snackbar.dart';
import '../utils/success_snackbar.dart';
import 'pay_pal_transation.dart';

void handelPayPalCheckout({
  required AddressInputEntity addressInputEntity,
  required BuildContext context,
  required AppThemeHelper theme,
  required List<CartItemEntity> cartItemEntity,
}) {
  final addOrderCubit = context.read<AddOrderCubit>();
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return PaypalCheckoutView(
          sandboxMode: true,
          note: "thank you for your purchase",
          onSuccess: (Map parms) {
            Navigator.pop(context);
            buildSuccessSnackbar(
              message: "payment success",
              theme: theme,
              context: context,
            );
            addOrderCubit.addOrder(addressInputEntity: addressInputEntity);
          },
          onError: (Map parms) {
            Navigator.pop(context);
            buildErrorSnackbar(
              message: "payment failed",
              theme: theme,
              context: context,
            );
            log("error: $parms");
          },
          onCancel: () {
            Navigator.pop(context);
            buildErrorSnackbar(
              message: "payment canceled",
              theme: theme,
              context: context,
            );
          },
          transactions: payPalTransaction(cartItems: cartItemEntity),
          clientId: AppKeys.payPalClientId,
          secretKey: AppKeys.payPalSecret,
        );
      },
    ),
  );
}
