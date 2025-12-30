import 'package:flutter/material.dart';
import 'track_order_map.dart';

class TrackOrderViewBody extends StatelessWidget {
  const TrackOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(child: TrackOrderMap()),
        Expanded(child: ColoredBox(color: Colors.red)),
      ],
    );
  }
}
