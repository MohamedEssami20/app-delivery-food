import 'package:app_delivey_food/core/utils/build_order_timeline_contenet.dart';
import 'package:flutter/material.dart';
import 'package:timelines_upgraded/timelines_upgraded.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class OrderTimelineSection extends StatelessWidget {
  const OrderTimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
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
              color: index == 0
                  ? theme.colors.primary600
                  : Colors.grey.shade300,
            );
          },

          indicatorBuilder: (_, index) {
            final isActive = index == 0;
            if (index == 0) {
              return DotIndicator(
                size: isActive ? 28 : 25,
                color: theme.colors.primary600,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: isActive ? 22 : 18,
                ),
              );
            } else {
              return DotIndicator(color: Colors.grey.shade300);
            }
          },

          contentsBuilder: (_, index) {
            final isActive = index == 0;
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                bottom: 24,
                top: isActive ? 6 : 0,
              ),
              child: buildOrderTimelineContent(index, theme),
            );
          },
        ),
      ),
    );
  }
}
