import 'package:app_delivey_food/features/home/presentation/views/widgets/build/get_featured_item_builder.dart';
import 'package:flutter/material.dart';

import 'build/get_products_list_builder.dart';
import 'category_items_list.dart';

class HomeViewBodySection extends StatelessWidget {
  const HomeViewBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GetFeaturedItemBuilder(),
        const SizedBox(height: 32),
        CategoryItemsList(),
        const SizedBox(height: 16),
        Expanded(child: GetProductsListBuilder()),
      ],
    );
  }
}