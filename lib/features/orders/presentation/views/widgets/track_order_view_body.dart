import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'delivery_details_section.dart';
import 'track_order_map.dart';

class TrackOrderViewBody extends StatelessWidget {
  const TrackOrderViewBody({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Expanded(
          child: Stack(
            children: [
              TrackOrderMap(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: DeliveryDetailsSection(cartItems: cartItems,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
