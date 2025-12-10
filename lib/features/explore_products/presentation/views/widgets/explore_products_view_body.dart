import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'food_type_section_builder.dart';

class ExploreProductsViewBody extends StatelessWidget {
  const ExploreProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 20,
        children: [
          CustomTextFormFiled(
            hintText: "Search for food...",
            textInputType: TextInputType.text,
            prefixIcon: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(
                Assets.assetsIconsSearchIcon,
                colorFilter: ColorFilter.mode(
                  theme.colors.typography400,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Expanded(child: FoodTypeSectionBuilder()),
        ],
      ),
    );
  }
}
