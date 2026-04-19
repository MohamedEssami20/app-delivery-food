import 'package:flutter/material.dart';

import '../../../domain/entities/get_dummy_orders.dart';
import '../../../domain/entities/order_entity.dart';
import 'my_orders_tab_switcher.dart';
import 'order_item.dart';

class MyOrdersViewBody extends StatefulWidget {
  const MyOrdersViewBody({super.key});

  @override
  State<MyOrdersViewBody> createState() => _MyOrdersViewBodyState();
}

class _MyOrdersViewBodyState extends State<MyOrdersViewBody> {
  bool _isCurrentSelected = true;

  final List<OrderEntity> _allOrders = getDummyOrders();

  List<OrderEntity> get _currentOrders =>
      _allOrders.where((o) => o.isCurrent).toList();

  List<OrderEntity> get _previousOrders =>
      _allOrders.where((o) => !o.isCurrent).toList();

  bool get _hasCurrentOrders => _currentOrders.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyOrdersTabSwitcher(
          isCurrentSelected: _isCurrentSelected,
          hasCurrentOrders: _hasCurrentOrders,
          onCurrentTap: () => setState(() => _isCurrentSelected = true),
          onPreviousTap: () => setState(() => _isCurrentSelected = false),
        ),
        Expanded(
          child: Padding(
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
          ),
        ),
      ],
    );
  }
}
