import 'package:app_delivey_food/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/custom_naviagtion_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = 'main';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SafeArea(child: MainViewBody()),
    );
  }
}
