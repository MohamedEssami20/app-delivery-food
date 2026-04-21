import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../domain/entities/get_dummy_orders.dart';
import '../../../domain/entities/my_order_entity.dart';
import '../../manager/get_all_orders/get_all_orders_cubit.dart';
import 'my_orders_empty_view.dart';
import 'my_orders_section.dart';

class MyOrdesSectionBuilder extends StatelessWidget {
  const MyOrdesSectionBuilder({super.key, required this.isCurrentSelected});
  final bool isCurrentSelected;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllOrdersCubit, GetAllOrdersState>(
      builder: ((context, state) {
        if (state is GetAllOrdersLoading) {
          return Skeletonizer(
            child: MyOrdersSection(
              isCurrentSelected: isCurrentSelected,
              currentOrders: getDummyOrders(),
              previousOrders: getDummyOrders(),
            ),
          );
        }
        if (state is GetAllOrdersFailure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text("Something went wrong , please try again"),
            ),
          );
        }
        if (state is GetAllOrdersSuccess) {
          List<MyOrderEntity> currentOrders = state.orders
              .where((o) => o.isCurrent)
              .toList();
          List<MyOrderEntity> previousOrders = state.orders
              .where((o) => !o.isCurrent)
              .toList();
          if (state.orders.isNotEmpty) {
            return MyOrdersSection(
              isCurrentSelected: isCurrentSelected,
              currentOrders: currentOrders,
              previousOrders: previousOrders,
            );
          } else {
            return const MyOrderEmptyView();
          }
        }
        return const SizedBox();
      }),
    );
  }
}
