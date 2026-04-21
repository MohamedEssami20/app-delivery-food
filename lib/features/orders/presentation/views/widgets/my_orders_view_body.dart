import 'package:app_delivey_food/features/orders/presentation/manager/get_all_orders/get_all_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/my_order_entity.dart';
import 'my_order_section_builder.dart';
import 'my_orders_tab_switcher.dart';

class MyOrdersViewBody extends StatefulWidget {
  const MyOrdersViewBody({super.key});

  @override
  State<MyOrdersViewBody> createState() => _MyOrdersViewBodyState();
}

class _MyOrdersViewBodyState extends State<MyOrdersViewBody> {
  bool _isCurrentSelected = true;

  late List<MyOrderEntity> _allOrders;
  @override
  void initState() {
    context.read<GetAllOrdersCubit>().getAllOrders();
    _allOrders = context.read<GetAllOrdersCubit>().allOrders ?? [];
    super.initState();
  }

  List<MyOrderEntity> get _currentOrders => _allOrders.isNotEmpty
      ? _allOrders.where((o) => o.isCurrent).toList()
      : [];

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
          child: MyOrdesSectionBuilder(isCurrentSelected: _isCurrentSelected),
        ),
      ],
    );
  }
}
