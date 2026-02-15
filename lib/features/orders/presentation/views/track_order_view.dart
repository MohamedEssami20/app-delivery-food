import 'package:app_delivey_food/core/function/build_second_custom_app_bar.dart';
import 'package:app_delivey_food/core/helper/order_placed_args.dart';
import 'package:app_delivey_food/core/services/get_it_services.dart';
import 'package:app_delivey_food/features/orders/domain/repos/orders_repos.dart';
import 'package:app_delivey_food/features/orders/presentation/manager/get_order_status/get_order_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../../../core/utils/assets.dart';
import 'widgets/track_order_view_body.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({
    super.key,
    required this.args,
  });
  static const String routeName = 'track-order';
  final OrderPlacedArgs args;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocProvider(
      create: (context) => GetOrderStatusCubit(
        ordersRepo: GetItService.getIt.get<OrdersRepos>(),
      ),
      child: Scaffold(
        appBar: buildSecondCustomAppBar(
          theme: theme,
          title: "Track Order",
          titleIcon: Assets.assetsIconsTrackOrderIcon,
          context: context,
          showBackButton: true,
          onBackPress: () {
            Navigator.pop(context);
          },
        ),
        body: TrackOrderViewBody(cartItems: args.cartItems, orderId: args.orderId),
      ),
    );
  }
}
