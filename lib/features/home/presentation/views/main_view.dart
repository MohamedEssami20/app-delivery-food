import 'package:app_delivey_food/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: SafeArea(child: MainViewBody(selectedIndex: currentIndex)),
    );
  }
}
