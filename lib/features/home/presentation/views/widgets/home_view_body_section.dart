import 'package:flutter/material.dart';

import 'build/get_products_list_builder.dart';
import 'category_items_list.dart';
import 'featured_item_list_view.dart';

class HomeViewBodySection extends StatelessWidget {
  const HomeViewBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FeaturedItemListView(),
        const SizedBox(height: 32),
        CategoryItemsList(),
        const SizedBox(height: 16),
        Expanded(child: GetProductsListBuilder()),
      ],
    );
  }
}