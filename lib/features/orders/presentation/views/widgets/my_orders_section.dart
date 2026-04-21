import 'package:flutter/material.dart';

import '../../../domain/entities/my_order_entity.dart';
import 'order_item.dart';

class MyOrdersSection extends StatelessWidget {
  const MyOrdersSection({
    super.key,
    required bool isCurrentSelected,
    required List<MyOrderEntity> currentOrders,
    required List<MyOrderEntity> previousOrders,
  }) : _isCurrentSelected = isCurrentSelected,
       _currentOrders = currentOrders,
       _previousOrders = previousOrders;

  final bool _isCurrentSelected;
  final List<MyOrderEntity> _currentOrders;
  final List<MyOrderEntity> _previousOrders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.04, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
        child: ListView.builder(
          key: ValueKey(_isCurrentSelected),
          padding: const EdgeInsets.only(top: 24),
          itemCount: _isCurrentSelected
              ? _currentOrders.length
              : _previousOrders.length,
          itemBuilder: (context, index) {
            final order = _isCurrentSelected
                ? _currentOrders[index]
                : _previousOrders[index];
            return OrderItem(order: order);
          },
        ),
      ),
    );
  }
}
