import 'package:app_delivey_food/core/function/build_second_custom_app_bar.dart';
import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';
import 'widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return SafeArea(
      child: Scaffold(
        appBar: buildSecondCustomAppBar(
          theme: theme,
          context: context,
          title: "Cart",
          titleIcon: Assets.assetsIconsCartNavigationIcon,
        ),
        body: CartViewBody(),
      ),
    );
  }
}
