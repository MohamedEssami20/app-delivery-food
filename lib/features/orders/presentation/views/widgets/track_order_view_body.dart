import 'package:flutter/material.dart';
import 'delivery_details_section.dart';
import 'track_order_map.dart';

class TrackOrderViewBody extends StatelessWidget {
  const TrackOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          child: Stack(
            children: [
              TrackOrderMap(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: DeliveryDetailsSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
