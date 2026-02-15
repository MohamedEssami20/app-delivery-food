import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/get_order_status/get_order_status_cubit.dart';
import 'delivery_details_section.dart';
import 'track_order_map.dart';

class TrackOrderViewBody extends StatefulWidget {
  const TrackOrderViewBody({super.key, required this.cartItems, required this.orderId});
  final List<CartItemEntity> cartItems;
  final int orderId;
  @override
  State<TrackOrderViewBody> createState() => _TrackOrderViewBodyState();
}

class _TrackOrderViewBodyState extends State<TrackOrderViewBody> {
  @override
  void initState() {
    context.read<GetOrderStatusCubit>().getOrderStatus(orderId: widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              TrackOrderMap(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: DeliveryDetailsSection(cartItems: widget.cartItems),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
