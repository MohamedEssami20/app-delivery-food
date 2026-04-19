import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/core/helper/custom_network_image.dart';
import 'package:app_delivey_food/features/favorites/presentation/views/widgets/favorite_product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../home/presentation/manager/favorite_cubit/favorite_cubit.dart';

class FavoriteProductItem extends StatelessWidget {
  const FavoriteProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: theme.colors.grey0,
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        border: Border.all(color: theme.colors.grey100, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // product image with rating badge;
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: CustomNetowrkImage(
                      imageUrl: productEntity.baseImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 8,
                  child: Container(
                    margin: const EdgeInsets.only(left: 4),
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 2,
                      bottom: 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: theme.colors.grey50,
                    ),
                    child: Row(
                      spacing: 8,
                      children: [
                        SvgPicture.asset(
                          Assets.assetsIconsRatingIcon,
                          height: 12,
                          width: 12,
                        ),
                        Text(
                          '${productEntity.avrageRating}',
                          style: theme.textStyles.bodyMedium!.copyWith(
                            color: theme.colors.typography400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // product details + remove button;
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                FavoriteProductDetails(
                  theme: theme,
                  productEntity: productEntity,
                ),
                // remove from favorites button;
                Positioned(
                  top: 4,
                  right: 4,
                  child: BlocBuilder<FavoriteFoodCubit, FavoriteFoodState>(
                    builder: (context, state) {
                      final isLoading =
                          (state is RemoveFavoriteLoading &&
                              state.foodId == productEntity.id) ||
                          (state is AddFavoriteLoading &&
                              state.foodId == productEntity.id);

                      return GestureDetector(
                        onTap: isLoading
                            ? null
                            : () {
                                context
                                    .read<FavoriteFoodCubit>()
                                    .removeFavoriteFood(
                                      foodId: productEntity.id,
                                    );
                              },
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: theme.colors.grey100,
                            shape: BoxShape.circle,
                          ),
                          child: isLoading
                              ? Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: theme.colors.grey400,
                                  ),
                                )
                              : SvgPicture.asset(
                                  Assets.assetsIconsFavoriteNavigatioinIcon,
                                  fit: BoxFit.scaleDown,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.red,
                                    BlendMode.srcIn,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
