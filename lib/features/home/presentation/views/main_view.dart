import 'package:app_delivey_food/core/cubit/cubit/bottom_naviagtion_bar_cubit.dart';
import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/helper/cart_state_listener.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:app_delivey_food/features/search/presentation/manager/search_products_cubit/search_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_services.dart';
import '../../../../core/utils/custom_naviagtion_bar.dart';
import '../../../search/domain/repos/search_repo.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = 'main';

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return BlocBuilder<BottomNavigtionBarCubit, int>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.colors.grey0,
          bottomNavigationBar: CustomBottomNavigationBar(
          ),
          body: CartStateListener(
            child: SafeArea(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => SearchProductsCubit(
                      searchRepos: GetItService.getIt.get<SearchRepo>(),
                    ),
                  ),
                ],
                child: MainViewBody(selectedIndex: state),
              ),
            ),
          ),
        );
      },
    );
  }
}
