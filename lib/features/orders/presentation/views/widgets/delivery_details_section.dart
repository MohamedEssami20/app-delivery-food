import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/features/checkout/presentation/views/widgets/order_placed_details_item.dart';
import 'package:app_delivey_food/features/orders/presentation/views/cancel_order_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helper/app_theme_helper.dart';
import 'delivery_guy_details.dart';
import 'food_to_be_delivered_list.dart';
import 'oreder_timeline_section.dart';
import 'track_order_buttons_item.dart';

class DeliveryDetailsSection extends StatefulWidget {
  const DeliveryDetailsSection({super.key});

  @override
  State<DeliveryDetailsSection> createState() => _DeliveryDetailsSectionState();
}

class _DeliveryDetailsSectionState extends State<DeliveryDetailsSection> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return AnimatedSize(
      alignment: AlignmentGeometry.bottomCenter,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      reverseDuration: Duration(milliseconds: 300),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colors.white,
          borderRadius: BorderRadius.circular(16),
          shape: BoxShape.rectangle,
          border: Border.all(color: theme.colors.grey200, width: 1.2),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            DeliveryGuyDetails(theme: theme),
            Divider(color: theme.colors.grey200, thickness: 1.2),
            OrderPlacedDetailsItem(
              icon: Assets.assetsIconsClockIcon,
              title: "Estimated time",
              subTiltle: "30 min",
            ),
            Visibility(
              visible: isExpanded,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: OrderTimelineSection(),
              ),
            ),
            OrderPlacedDetailsItem(
              icon: Assets.assetsIconsLocationIcon,
              title: "Deliver to",
              subTiltle: "Home",
            ),
            Visibility(
              visible: isExpanded,
              child: OrderPlacedDetailsItem(
                icon: Assets.assetsIconsAmountIcon,
                title: "Amount paid",
                subTiltle: "\$ 100",
              ),
            ),
            Visibility(visible: isExpanded, child: FoodTobeDeliveredList()),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: TrackOrderButtonsItem(
                    theme: theme,
                    title: isExpanded ? "Less Details" : "More Details",
                    onPress: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TrackOrderButtonsItem(
                    onPress: () {
                      Navigator.pushNamed(context, CancelOrderView.routeName);
                    },
                    theme: theme,
                    title: "Cancel Order",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}