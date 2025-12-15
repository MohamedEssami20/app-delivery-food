import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/features/explore_products/presentation/views/widgets/back_to_normal_food_type_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/helper/get_dummy_product_entitiy.dart';
import '../../manager/get_explore_foods/get_explore_foods_cubit.dart';
import 'selected_food_category_section.dart';

class SelectedFoodCategoryBuilder extends StatelessWidget {
  const SelectedFoodCategoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExploreFoodsCubit, GetExploreFoodsState>(
      builder: (context, state) {
        if (state is GetExploreFoodsSuccess) {
          return SelectedFoodCategorySection(products: state.products);
        } else if (state is GetExploreFoodsFailure) {
          return Column(
            children: [
              BackToNormalFoodTypeView(theme: AppThemeHelper(context)),
              Center(child: Text(state.errorMessage)),
            ],
          );
        }
        return Skeletonizer(
          child: SelectedFoodCategorySection(products: getListDummyProduct()),
        );
      },
    );
  }
}
