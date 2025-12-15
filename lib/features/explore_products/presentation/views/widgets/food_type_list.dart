import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/features/home/presentation/views/details_view.dart';
import 'package:flutter/material.dart';

import 'food_type_item.dart';

class FoodTypeListView extends StatelessWidget {
  const FoodTypeListView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.67,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 2.5,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsView.routeName,
            arguments: products[index],
          ),
          child: FoodTypeItem(productEntity: products[index]),
        ),
      ),
    );
  }
}
