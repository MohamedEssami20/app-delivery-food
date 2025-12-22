
import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItemEntityList});
  final List<CartItemEntity> cartItemEntityList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: CartItem(
          productEntity:
              cartItemEntityList[index].productEntity,
          productQuantity: cartItemEntityList[index].quantity,
        ),
      ),
      itemCount: cartItemEntityList.length,
    );
  }
}
