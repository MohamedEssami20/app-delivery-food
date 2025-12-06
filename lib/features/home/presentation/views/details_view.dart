import 'package:app_delivey_food/core/function/build_custom_app_bar.dart';
import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

import 'widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.product});
  static const routeName = 'details';
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Scaffold(
      backgroundColor: theme.colors.grey0,
      appBar: buildCustomAppBar(
        theme: theme,
        context: context,
        showBackButton: true,
        showActionButton: true,
      ),
      body: DetailsViewBody(productEntity: product,),
    );
  }
}
