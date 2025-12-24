import 'package:app_delivey_food/core/function/build_second_custom_app_bar.dart';
import 'package:app_delivey_food/features/checkout/presentation/views/widgets/address_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/app_theme_helper.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});
  static const routeName = 'address';
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Scaffold(
      appBar: buildSecondCustomAppBar(
        theme: theme,
        title: "Add Address",
        titleIcon: "",
        context: context,
        showBackButton: true,
        onBackPress: () {},
        showTitleIcon: false,
      ),
      body: AddressViewBody(),
    );
  }
}
