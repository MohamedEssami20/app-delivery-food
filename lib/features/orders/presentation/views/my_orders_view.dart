import 'package:app_delivey_food/core/services/get_it_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../domain/repos/orders_repos.dart';
import '../manager/get_all_orders/get_all_orders_cubit.dart';
import 'widgets/my_orders_view_body.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  static const String routeName = '/my_orders';

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);

    return BlocProvider(
      create: (context) =>
          GetAllOrdersCubit(ordersRepos: GetItService.getIt<OrdersRepos>()),
      child: Scaffold(
        backgroundColor: theme.colors.grey0,
        appBar: AppBar(
          backgroundColor: theme.colors.grey0,
          elevation: 0,
          leadingWidth: 80,
          leading: TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: theme.colors.typography500,
              size: 18,
            ),
            label: Text(
              "Back",
              style: theme.textStyles.titleMedium!.copyWith(
                color: theme.colors.typography500,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
            ),
          ),
          title: Text(
            "My Orders",
            style: theme.textStyles.headlineMedium!.copyWith(
              color: theme.colors.typography500,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: theme.colors.typography500),
            ),
          ],
        ),
        body: const MyOrdersViewBody(),
      ),
    );
  }
}
