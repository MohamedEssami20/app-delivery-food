import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/core/utils/build_search_home_appbar.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:app_delivey_food/features/search/presentation/manager/explore_search_mode/explore_search_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/function/on_change_action_in_explore_view.dart';
import '../../../../../core/function/on_submit_action_in_explore_view.dart';
import '../../../../../core/utils/explore_search_mode.dart';
import 'food_type_section_builder.dart';

class ExploreProductsViewBody extends StatefulWidget {
  const ExploreProductsViewBody({super.key});

  @override
  State<ExploreProductsViewBody> createState() =>
      _ExploreProductsViewBodyState();
}

class _ExploreProductsViewBodyState extends State<ExploreProductsViewBody> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 20,
        children: [
          BlocSelector<
            ExploreSearchModeCubit,
            ExploreSearchMode,
            ExploreSearchMode
          >(
            selector: (state) {
              return state;
            },
            builder: (context, state) {
              return Visibility(
                visible:
                    state == ExploreSearchMode.searching ||
                    state == ExploreSearchMode.latest,
                child: buildSearchHomeAppBar(
                  context: context,
                  theme: theme,
                  onBackPress: () {
                    context
                        .read<ExploreSearchModeCubit>()
                        .changeNormalMode();
                    searchController.clear();
                  },
                ),
              );
            },
          ),
          CustomTextFormFiled(
            controller: searchController,
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
              onChangeActionInExploreView(value, context);
            },
            onSubmit: (value) {
              onSubmitActionInExploreView(value, context);
            },
          ),
          Expanded(child: FoodTypeSectionBuilder()),
        ],
      ),
    );
  }
}
