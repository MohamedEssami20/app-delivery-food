import 'package:app_delivey_food/core/helper/get_dummy_product_entitiy.dart';
import 'package:app_delivey_food/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [CartItem(productEntity: getDummyProduct())]),
    );
  }
}
