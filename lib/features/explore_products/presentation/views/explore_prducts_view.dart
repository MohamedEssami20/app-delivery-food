import 'package:app_delivey_food/features/explore_products/presentation/views/widgets/explore_products_view_body.dart';
import 'package:app_delivey_food/features/search/presentation/manager/explore_search_input_cubit/explore_search_input_cubit.dart';
import 'package:app_delivey_food/features/search/presentation/manager/explore_search_mode/explore_search_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_services.dart';
import '../../entities/repos/explore_product_repo.dart';
import '../manager/change_food_type_cubit/change_food_type_cubit.dart';
import '../manager/get_explore_foods/get_explore_foods_cubit.dart';

class ExplorePrductsView extends StatelessWidget {
  const ExplorePrductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChangeFoodTypeCubit()),
        BlocProvider(create: (context) => ExploreSearchModeCubit()),
        BlocProvider(
          create: (context) => GetExploreFoodsCubit(
            exploreProductRepo: GetItService.getIt.get<ExploreProductRepo>(),
          ),
        ),
        BlocProvider(create: (context) => ExploreSearchInputCubit()),
      ],
      child: SafeArea(child: ExploreProductsViewBody()),
    );
  }
}
