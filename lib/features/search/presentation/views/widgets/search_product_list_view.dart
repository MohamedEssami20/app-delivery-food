import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/features/home/presentation/views/details_view.dart';
import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/product_item.dart';

class SearchProductListView extends StatelessWidget {
  const SearchProductListView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailsView.routeName,
            arguments: products[index],
          );
        },
        child: ProductItem(productEntity: products[index]),
      ),
    );
  }
}
