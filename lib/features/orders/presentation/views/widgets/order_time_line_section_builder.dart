import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../manager/get_order_status/get_order_status_cubit.dart';
import 'oreder_timeline_section.dart';

class OrderTimeLineSectionBuilder extends StatelessWidget {
  const OrderTimeLineSectionBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrderStatusCubit, GetOrderStatusState>(
      builder: (context, state) {
        if (state is GetOrderStatusSuccess) {
          return OrderTimelineSection(currentStatus: state.orderStatus);
        } else {
          return Skeletonizer(child: OrderTimelineSection(currentStatus: ""));
        }
      },
    );
  }
}