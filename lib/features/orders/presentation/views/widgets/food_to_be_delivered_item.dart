import 'package:app_delivey_food/core/helper/custom_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class FoodToBeDeliveredItem extends StatelessWidget {
  const FoodToBeDeliveredItem({
    super.key,
    required this.image,
    required this.quantity,
  });

  final String image;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final double imageSize = constraints.maxHeight.clamp(60, 72);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                width: imageSize,
                height: imageSize,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CustomNetowrkImage(imageUrl: image, fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "x $quantity",
                style: theme.textStyles.labelMedium?.copyWith(
                  color: theme.colors.typography300,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}