import 'package:app_delivey_food/core/function/build_home_app_bar.dart';
import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/category_items_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/helper/app_theme_helper.dart';
import 'featured_item_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHomeAppBar(theme),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  child: CustomTextFormFiled(
                    onSaved: (value) {},
                    prefixIcon: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(Assets.assetsIconsSearchIcon),
                    ),
                    hintText: "Search...",
                    textInputType: TextInputType.text,
                  ),
                ),
                const SizedBox(height: 8),
                const FeaturedItemListView(),
                const SizedBox(height: 8),
                CategoryItemsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
