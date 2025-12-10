import 'package:app_delivey_food/features/explore_products/presentation/views/widgets/explore_products_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/change_food_type_cubit/change_food_type_cubit.dart';

class ExplorePrductsView extends StatelessWidget {
  const ExplorePrductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeFoodTypeCubit(),
      child: SafeArea(child: ExploreProductsViewBody()),
    );
  }
}
