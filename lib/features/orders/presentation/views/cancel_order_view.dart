import 'package:app_delivey_food/core/function/build_custom_app_bar.dart';
import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/features/orders/presentation/views/widgets/cancel_order_view_body.dart';
import 'package:flutter/material.dart';

class CancelOrderView extends StatelessWidget {
  const CancelOrderView({super.key});
  static const String routeName = "CanelOrder";
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Scaffold(
      backgroundColor: theme.colors.white,
      appBar: buildCustomAppBar(
        theme: theme,
        context: context,
        showActionButton: false,
        showBackButton: true,
        title: "Cancel order",
        showTitle: true,
      ),
      body: CancelOrderViewBody(),
    );
  }
}
