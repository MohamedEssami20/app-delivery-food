import 'package:app_delivey_food/features/home/domain/entities/product_entity.dart';
import 'package:app_delivey_food/features/home/presentation/views/details_view.dart';
import 'package:flutter/material.dart';

import 'product_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.products});
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
          Navigator.pushNamed(context, DetailsView.routeName);
        },
        child: ProductItem(productEntity: products[index]),
      ),
    );
  }
}
