import 'package:app_delivey_food/core/function/build_second_custom_app_bar.dart';
import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../../../core/utils/assets.dart';
import 'widgets/track_order_view_body.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key, required this.cartItem});
  static const String routeName = 'track-order';
  final List<CartItemEntity> cartItem;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Scaffold(
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
      body: TrackOrderViewBody(cartItems: cartItem,),
    );
  }
}
