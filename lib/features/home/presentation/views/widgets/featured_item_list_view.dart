import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';

class FeaturedItemListView extends StatelessWidget {
  const FeaturedItemListView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: products.length == 1
            ? const NeverScrollableScrollPhysics()
            : null,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FeaturedItem(productEntity: products[index]),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
