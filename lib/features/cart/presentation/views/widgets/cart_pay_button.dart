import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';
import 'package:app_delivey_food/features/checkout/presentation/views/address_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/custom_button.dart';

class CartPayButton extends StatelessWidget {
  const CartPayButton({
    super.key,
    required this.totalPrice,
    required this.cartItemEntity,
  });
  final num totalPrice;
  final List<CartItemEntity> cartItemEntity;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            "\$ $totalPrice",
            style: theme.textStyles.displaySmall!.copyWith(
              color: theme.colors.typography500,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: CustomButton(
            padding: EdgeInsetsDirectional.symmetric(vertical: 12),
            label: "Proceed to pay",
            backgroundColor: theme.colors.primary600,
            onPressed: () {
              Navigator.pushNamed(
                context,
                AddressView.routeName,
                arguments: cartItemEntity,
              );
            },
          ),
        ),
      ],
    );
  }
}
