import 'package:app_delivey_food/core/services/get_it_services.dart';
import 'package:app_delivey_food/features/home/domain/repos/home_repo.dart';
import 'package:app_delivey_food/features/home/presentation/manager/get_advertising_product/get_advertising_product_cubit.dart';
import 'package:app_delivey_food/features/home/presentation/manager/get_product_cubit/get_products_cubit.dart';
import 'package:app_delivey_food/features/home/presentation/manager/user_cubit/user_cubit.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UserCubit(homeRepo: GetItService.getIt.get<HomeRepo>()),
          ),
          BlocProvider(
            create: (context) =>
                GetProductsCubit(homeRepo: GetItService.getIt.get<HomeRepo>()),
          ),
          BlocProvider(
            create: (context) => GetAdvertisingProductCubit(
              homeRepo: GetItService.getIt.get<HomeRepo>(),
            ),
          ),
        ],
        child: HomeViewBody(),
      ),
    );
  }
}
