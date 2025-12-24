import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../manager/cart_cubit/cart_cubit.dart';

class IcrementAndDecrementCartItem extends StatelessWidget {
  const IcrementAndDecrementCartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Row(
      spacing: 12,
      children: [
        GestureDetector(
          onTap: () {
            if (cartItemEntity.quantity > 1) {
              context.read<CartCubit>().decrementQuantity(cartItemEntity);
            } else {
              context.read<CartCubit>().removeProductFromCart(cartItemEntity);
            }
          },
          child: Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colors.primary600,
            ),
            child: Icon(
              cartItemEntity.quantity == 1 ? Icons.delete : Icons.remove,
              color: theme.colors.white,
            ),
          ),
        ),
        Text(
          "${cartItemEntity.quantity}",
          style: theme.textStyles.bodyMedium!.copyWith(
            color: theme.colors.typography500,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<CartCubit>().incrementQuantity(cartItemEntity);
          },
          child: Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colors.primary600,
            ),
            child: Icon(Icons.add, color: theme.colors.white),
          ),
        ),
      ],
    );
  }
}
