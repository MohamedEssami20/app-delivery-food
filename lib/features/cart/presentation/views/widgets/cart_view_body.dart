import 'package:flutter/material.dart';
import 'cart_item_list.dart';
import 'cart_pay_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(child: CartItemList()),
          Visibility(child: CartPayButton()),
        ],
      ),
    );
  }
}

