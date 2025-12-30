import 'package:app_delivey_food/core/function/build_second_custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';
import '../../../../core/utils/assets.dart';
import 'widgets/track_order_view_body.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key});
  static const String routeName = 'track-order';
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Scaffold(
      appBar: buildSecondCustomAppBar(
        theme: theme,
        title: "Track Order",
        titleIcon:Assets.assetsIconsTrackOrderIcon ,
        context: context,
        showBackButton: true,
        onBackPress: () {
          Navigator.pop(context);
        },
      ),
      body: TrackOrderViewBody(),
    );
  }
}
