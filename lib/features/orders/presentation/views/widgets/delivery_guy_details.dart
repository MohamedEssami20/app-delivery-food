import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';
import 'delivery_guy_contact_item.dart';

class DeliveryGuyDetails extends StatelessWidget {
  const DeliveryGuyDetails({
    super.key,
    required this.theme,
  });

  final AppThemeHelper theme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Image.asset(Assets.assetsImagesDeliveryGuy),
      title: Text(
        "Cliff Rogers",
        style: theme.textStyles.titleMedium?.copyWith(
          color: theme.colors.typography500,
        ),
      ),
      subtitle: Text(
        "Delivery Guy",
        style: theme.textStyles.labelMedium?.copyWith(
          color: theme.colors.typography400,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          DeliveryGuyContactItem(
            theme: theme,
            icon: Assets.assetsIconsMessageIcon,
          ),
          DeliveryGuyContactItem(
            theme: theme,
            icon: Assets.assetsIconsCallFilledIcon,
          ),
        ],
      ),
    );
  }
}