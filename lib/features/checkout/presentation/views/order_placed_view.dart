import 'package:app_delivey_food/core/helper/order_placed_args.dart';
import 'package:app_delivey_food/features/checkout/presentation/views/widgets/order_placed_view_body.dart';
import 'package:app_delivey_food/features/home/presentation/views/main_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';

class OrderPlacedView extends StatelessWidget {
  const OrderPlacedView({super.key, required this.args});
  final OrderPlacedArgs args;
  static const routeName = 'order-placed';
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              MainView.routeName,
              (_) => false,
            );
          },
          icon: Icon(
            Icons.close,
            size: 30,
            color: theme.colors.typography500,
          ),
        ),
      ),
      body: SafeArea(
        child: OrderPlacedViewBody(
          totalAmount: args.cartItems
              .map((e) => e.calculateTotalPrice())
              .reduce((value, element) => value + element)
              .toString(),
          cartItemEntity: args.cartItems,
          orderId: args.orderId,
        ),
      ),
    );
  }
}
