import 'package:app_delivey_food/core/utils/build_order_timeline_contenet.dart';
import 'package:flutter/material.dart';
import 'package:timelines_upgraded/timelines_upgraded.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class OrderTimelineSection extends StatelessWidget {
  const OrderTimelineSection({super.key, required this.currentStatus});
  final String currentStatus;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    final currentSteps = getCurrentSteps(currentStatus);
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          connectorTheme: const ConnectorThemeData(thickness: 2.5),
          indicatorTheme: const IndicatorThemeData(size: 28),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: 3,

          connectorBuilder: (_, index, ___) {
            return SolidLineConnector(
              color: index <= currentSteps
                  ? theme.colors.primary600
                  : Colors.grey.shade300,
            );
          },

          indicatorBuilder: (_, index) {
            final isActive = index <= currentSteps;
            return DotIndicator(
              color: isActive ? theme.colors.primary600 : Colors.grey.shade300,
              size: 28,
              child: isActive
                  ? Icon(
                      Icons.location_pin,
                      color: theme.colors.white,
                      size: 20,
                    )
                  : null,
            );
          },

          contentsBuilder: (_, index) {
            final isActive = index <= currentSteps;
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                bottom: 24,
                top: isActive ? 6 : 0,
              ),
              child: buildOrderTimelineContent(index, theme, isActive),
            );
          },
        ),
      ),
    );
  }
}

int getCurrentSteps(String currentStatus) {
  switch (currentStatus) {
    case "preparing":
      return 0;
    case "onTheWay":
      return 1;
    case "delivered":
      return 2;
    default:
      return 0;
  }
}
