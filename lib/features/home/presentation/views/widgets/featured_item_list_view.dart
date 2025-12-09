import 'package:app_delivey_food/features/home/presentation/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/advertising_product_entity.dart';

class FeaturedItemListView extends StatelessWidget {
  const FeaturedItemListView({super.key, required this.products});
  final List<AdvertisingProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FeaturedItem(advertisingProduct: products[index]),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
