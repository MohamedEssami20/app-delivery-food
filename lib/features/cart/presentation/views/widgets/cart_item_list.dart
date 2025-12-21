import 'package:flutter/material.dart';

import '../../../../../core/helper/get_dummy_product_entitiy.dart';
import 'cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: CartItem(productEntity: getDummyProduct()),
      ),
      itemCount: 4,
    );
  }
}
