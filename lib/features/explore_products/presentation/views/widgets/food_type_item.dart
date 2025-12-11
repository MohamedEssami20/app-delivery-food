import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helper/app_theme_helper.dart';
import '../../../../../core/utils/assets.dart';
import 'food_type_details.dart';

class FoodTypeItem extends StatelessWidget {
  const FoodTypeItem({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: theme.colors.grey0,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        border: Border.all(color: theme.colors.grey100, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Image.asset(
                    Assets.assetsImagesBurgerProduct,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 8,
                  child: Container(
                    margin: EdgeInsets.only(left: 4),
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 2,
                      bottom: 2,
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
                          height: 12,
                          width: 12,
                        ),
                        Text(
                          "4.5",
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
          Expanded(flex: 3, child: FoodTypeDetails(theme: theme)),
        ],
      ),
    );
  }
}
