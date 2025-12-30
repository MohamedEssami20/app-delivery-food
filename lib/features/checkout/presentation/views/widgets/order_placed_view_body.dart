import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/core/utils/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../orders/presentation/views/track_order_view.dart';
import 'order_palced_header.dart';
import 'order_placed_details_item.dart';

class OrderPlacedViewBody extends StatelessWidget {
  const OrderPlacedViewBody({super.key, required this.totalAmount});
  final String totalAmount;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          OrderPlacedHeader(),
          const SizedBox(height: 30),
          Column(
            spacing: 12,
            children: [
              OrderPlacedDetailsItem(
                icon: Assets.assetsIconsClockIcon,
                title: "Estimated Time",
                subTiltle: "30 Mins",
              ),
              OrderPlacedDetailsItem(
                icon: Assets.assetsIconsLocationIcon,
                title: "Deliver to",
                subTiltle: "Home",
              ),
              OrderPlacedDetailsItem(
                icon: Assets.assetsIconsAmountIcon,
                title: "Amount paid",
                subTiltle: "\$ $totalAmount",
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, TrackOrderView.routeName);
              },
              padding: EdgeInsetsDirectional.symmetric(vertical: 12),
              backgroundColor: theme.colors.primary600,
              label: "Track my Order",
            ),
          ),
        ],
      ),
    );
  }
}
