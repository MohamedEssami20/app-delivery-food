import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:app_delivey_food/features/home/presentation/manager/get_advertising_product/get_advertising_product_cubit.dart';
import 'package:app_delivey_food/features/home/presentation/manager/get_product_cubit/get_products_cubit.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/build/build_user_home_bar_builder.dart';
import 'package:app_delivey_food/features/search/presentation/manager/home_search_input_cubit/search_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/function/on_change_action_in_home_view.dart';
import '../../../../../core/function/on_submit_action_in_home_view.dart';
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
    context.read<GetAdvertisingProductCubit>().getAdvertisingProduct();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeSearchInputCubit, String>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        searchController.text = state;
        searchController.selection = TextSelection.fromPosition(
          TextPosition(offset: searchController.text.length),
        );
      },
      child: Padding(
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
                      onSubmit: (value) {
                        onSubmitActionInHomeView(value, context);
                      },
                      onChanged: (value) {
                        onChangeActionInHomeView(value, context);
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
      ),
    );
  }
}
