import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:app_delivey_food/features/search/presentation/manager/search_products_cubit/search_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_services.dart';
import '../../../../core/utils/custom_naviagtion_bar.dart';
import '../../../search/domain/repos/search_repo.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Scaffold(
      backgroundColor: theme.colors.grey0,
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SearchProductsCubit(
                searchRepos: GetItService.getIt.get<SearchRepo>(),
              ),
            ),
          ],
          child: MainViewBody(selectedIndex: currentIndex),
        ),
      ),
    );
  }
}
