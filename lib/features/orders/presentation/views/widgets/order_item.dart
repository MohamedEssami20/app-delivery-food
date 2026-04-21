import 'package:app_delivey_food/core/helper/custom_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../domain/entities/my_order_entity.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});

  final MyOrderEntity order;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side images
              SizedBox(
                width: 72,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CustomNetowrkImage(
                        imageUrl: order.mainImage,
                        fit: BoxFit.cover,
                        width: 72,
                        height: 72,
                      ),
                    ),
                    if (order.extraImages.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CustomNetowrkImage(
                              imageUrl: order.extraImages.first.toString(),
                              width: 32,
                              height: 32,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            width: 34,
                            height: 32,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: theme.colors.grey100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "+1", // Mocked count
                              style: theme.textStyles.bodySmall!.copyWith(
                                color: theme.colors.typography500,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Right side details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.status,
                      style: theme.textStyles.titleMedium!.copyWith(
                        color: theme.colors.typography500,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildRowDetail(
                      theme,
                      order.dateOrTimeTitle,
                      order.dateOrTimeValue,
                    ),
                    const SizedBox(height: 6),
                    _buildRowDetail(theme, "Order summary", order.summary),
                    const SizedBox(height: 6),
                    _buildRowDetail(
                      theme,
                      "Total price paid",
                      "\$${order.orderTotalPrice}",
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Actions row
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(color: theme.colors.grey200),
                  ),
                  child: Text(
                    order.isCurrent ? "Track order" : "Reorder",
                    style: theme.textStyles.titleSmall!.copyWith(
                      color: theme.colors.typography500,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: theme.colors.grey200),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: theme.colors.typography500,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRowDetail(AppThemeHelper theme, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 110,
          child: Text(
            title,
            style: theme.textStyles.bodyMedium!.copyWith(
              color: theme.colors.typography400,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: theme.textStyles.titleSmall!.copyWith(
              color: theme.colors.typography500,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
