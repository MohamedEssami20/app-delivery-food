import 'package:app_delivey_food/core/helper/custom_network_image.dart';
import 'package:app_delivey_food/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: theme.colors.grey0,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        border: Border.all(color: theme.colors.grey100, width: 2),
      ),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.05,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  child: CustomNetowrkImage(
                    imageUrl: productEntity.baseImageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 8,
                  child: Container(
                    margin: EdgeInsets.only(left: 4),
                    padding: EdgeInsets.only(
                      left: 12,
                      right: 12,
                      top: 4,
                      bottom: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: theme.colors.grey50,
                    ),
                    child: Row(
                      spacing: 8,
                      children: [
                        SvgPicture.asset(
                          Assets.assetsIconsRatingIcon,
                          height: 14,
                          width: 14,
                        ),
                        Text(
                          productEntity.avrageRating.toString(),
                          style: theme.textStyles.bodyLarge!.copyWith(
                            color: theme.colors.typography500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productEntity.name,
                  style: theme.textStyles.titleSmall!.copyWith(
                    color: theme.colors.typography500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${productEntity.price} \$",
                      style: theme.textStyles.bodyLarge!.copyWith(
                        color: theme.colors.typography500,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colors.primary500,
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
