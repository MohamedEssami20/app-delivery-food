import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:app_delivey_food/features/home/presentation/manager/get_product_cubit/get_products_cubit.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/build/build_user_home_bar_builder.dart';
import 'package:app_delivey_food/features/search/presentation/manager/search_mode_cubit/search_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../search/presentation/manager/search_products_cubit/search_products_cubit.dart';
import '../../manager/user_cubit/user_cubit.dart';
import 'build/Home_view_body_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    context.read<UserCubit>().getUserData();
    context.read<GetProductsCubit>().getProductsOfCategory(category: 1);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                BuildUserHomeBarBuilder(searchController: searchController),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  child: CustomTextFormFiled(
                    controller: searchController,
                    onSaved: (value) {},
                    onSubmit: (value) {
                      context.read<SearchProductsCubit>().storeSearchQuery(
                        query: value,
                      );
                      context.read<SearchProductsCubit>().getSearchProducts(
                        query: value.trim(),
                      );
                    },
                    onChanged: (value) {
                      if (value.isNotEmpty && value.trim().isNotEmpty) {
                        context.read<SearchModeCubit>().changeSearchMode();
                        context.read<SearchProductsCubit>().getSearchProducts(
                          query: value.trim(),
                        );
                      } else {
                        context
                            .read<SearchModeCubit>()
                            .changeLatestSearchedMode();
                        context.read<SearchProductsCubit>().getSearchQuery();
                      }
                    },
                    prefixIcon: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(Assets.assetsIconsSearchIcon),
                    ),
                    hintText: "Search...",
                    textInputType: TextInputType.text,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(child: HomeViewBodyBuilder()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
