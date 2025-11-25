import 'package:app_delivey_food/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.selectedIndex});
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(index: selectedIndex, children: getHomeView);
  }
}

List<Widget> getHomeView = const [
  HomeView(),
  SizedBox(),
  SizedBox(),
  SizedBox(),
  SizedBox(),
];
