import 'package:app_delivey_food/core/function/build_custom_app_bar.dart';
import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:flutter/material.dart';

import 'widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});
  static const routeName = 'details';
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Scaffold(
      appBar: buildCustomAppBar(
        theme: theme,
        context: context,
        showBackButton: true,
        showActionButton: true,
      ),
      body: DetailsViewBody(),
    );
  }
}
