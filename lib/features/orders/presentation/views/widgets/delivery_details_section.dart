import 'package:flutter/material.dart';
import '../../../../../core/helper/app_theme_helper.dart';
import 'delivery_guy_details.dart';

class DeliveryDetailsSection extends StatelessWidget {
  const DeliveryDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      height: height * 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: theme.colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        spacing: 12,
        children: [
          DeliveryGuyDetails(theme: theme),
          Divider(color: theme.colors.grey200, thickness: 1.2),
        ],
      ),
    );
  }
}


