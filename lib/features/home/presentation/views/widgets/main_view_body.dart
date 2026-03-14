import 'package:app_delivey_food/features/cart/presentation/views/cart_view.dart';
import 'package:app_delivey_food/features/explore_products/presentation/views/explore_prducts_view.dart';
import 'package:app_delivey_food/features/favorites/presentation/views/favorite_view.dart';
import 'package:app_delivey_food/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

import 'lazy_index_stack.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.selectedIndex});
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return LazyIndexedStack(
      index: selectedIndex,
      children: const [
        HomeView(),
        ExplorePrductsView(),
        CartView(),
        FavoriteView(),
        SizedBox(),
      ],
    );
  }
}
