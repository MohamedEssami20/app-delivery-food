import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:app_delivey_food/features/home/presentation/manager/get_product_cubit/get_products_cubit.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/build/build_user_home_bar_builder.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/category_items_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../manager/user_cubit/user_cubit.dart';
import 'build/get_products_list_builder.dart';
import 'featured_item_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<UserCubit>().getUserData();
    context.read<GetProductsCubit>().getProductsOfCategory(category: 1);
    super.initState();
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
                BuildUserHomeBarBuilder(),
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
                const SizedBox(height: 8),
                Expanded(child: GetProductsListBuilder()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
