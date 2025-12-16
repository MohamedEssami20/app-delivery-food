import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:app_delivey_food/features/search/presentation/manager/search_products_cubit/search_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../search/presentation/manager/search_mode_cubit/search_mode_cubit.dart';
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
            onChanged: (value) {
              if (value.isNotEmpty && value.trim().isNotEmpty) {
                context.read<SearchModeCubit>().changeSearchedExploreMode();
                context.read<SearchProductsCubit>().getSearchProducts(
                  query: value.trim(),
                );
              } else {
                context.read<SearchModeCubit>().changeNormalExploreViewMode();
              }
            },
            onSubmit: (value) {
              if (value.isNotEmpty && value.trim().isNotEmpty) {
                context.read<SearchModeCubit>().changeSearchedExploreMode();
                context.read<SearchProductsCubit>().getSearchProducts(
                  query: value.trim(),
                );
              }
            },
          ),
          Expanded(child: FoodTypeSectionBuilder()),
        ],
      ),
    );
  }
}
