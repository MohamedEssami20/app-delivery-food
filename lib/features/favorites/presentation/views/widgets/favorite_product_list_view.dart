import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/features/favorites/presentation/views/widgets/favorite_product_item.dart';
import 'package:app_delivey_food/features/home/presentation/views/details_view.dart';
import 'package:flutter/material.dart';

class FavoriteProductListView extends StatelessWidget {
  const FavoriteProductListView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailsView.routeName,
            arguments: products[index],
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: FavoriteProductItem(productEntity: products[index]),
        ),
      ),
    );
  }
}
