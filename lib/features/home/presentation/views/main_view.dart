import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:app_delivey_food/features/search/presentation/manager/search_mode_cubit/search_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/custom_naviagtion_bar.dart';

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
        child: BlocProvider(
          create: (context) => SearchModeCubit(),
          child: MainViewBody(selectedIndex: currentIndex),
        ),
      ),
    );
  }
}
