import 'package:app_delivey_food/core/helper/custom_network_image.dart';
import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/features/home/domain/entities/advertising_product_entity.dart';
import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/features/home/presentation/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/custom_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key, required this.advertisingProduct});
  final AdvertisingProductEntity advertisingProduct;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 0),
      width: width * 0.9,
      decoration: BoxDecoration(
        color: AppThemeHelper(context).colors.primary100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${advertisingProduct.productDiscount}% OFF on Burgers!",
                  style: theme.textStyles.displayMedium!.copyWith(
                    color: theme.colors.typography500,
                  ),
                ),
                const SizedBox(height: 12),

                SizedBox(
                  width: 100,
                  height: 40,
                  child: CustomButton(
                    eleveation: 1.45,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        DetailsView.routeName,
                        arguments: convertToProductEntity(advertisingProduct),
                      );
                    },
                    backgroundColor: theme.colors.primary500,
                    child: Text(
                      "Buy now",
                      style: theme.textStyles.labelMedium!.copyWith(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w900,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      Assets.assetsImagesFeaturedBackground,
                      alignment: AlignmentGeometry.bottomRight,
                      fit: BoxFit.fill,
                      height: 150,
                      clipBehavior: Clip.none,
                      colorFilter: ColorFilter.mode(
                        theme.isDarkMode
                            ? Color(0xFF52574E)
                            : Color(0xffCADABD),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  CustomNetowrkImage(
                    imageUrl: advertisingProduct.baseImageUrl,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ProductEntity convertToProductEntity(AdvertisingProductEntity product) {
    return ProductEntity(
      id: product.id,
      name: product.name,
      discount: product.productDiscount.toInt(),
      category: "Advertising",
      description: product.description,
      price: product.price,
      code: 1,
      productType: product.productType,
      avrageRating: product.avrageRating,
      isFavourite: product.isFavourite ?? false,
      baseImageUrl: product.baseImageUrl!,
      productImageUrls: product.productImageUrls!,
      calories: product.calories,
      createdAt: product.createdAt!,
    );
  }
}
