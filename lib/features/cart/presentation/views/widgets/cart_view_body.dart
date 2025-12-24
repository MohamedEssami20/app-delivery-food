import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/cart_cubit/cart_cubit.dart';
import 'cart_item_list.dart';
import 'cart_pay_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is! CartLoaded) {
            return const SizedBox();
          }
          final cart = state.cartEntity;
          if (cart.cartItemList.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Cart is empty",
                    style: AppThemeHelper(context).textStyles.headlineSmall!
                        .copyWith(
                          color: AppThemeHelper(context).colors.typography500,
                        ),
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [
              Expanded(
                child: CartItemList(cartItemEntityList: cart.cartItemList),
              ),
              CartPayButton(totalPrice: cart.calculateTotalPrice()),
            ],
          );
        },
      ),
    );
  }
}

