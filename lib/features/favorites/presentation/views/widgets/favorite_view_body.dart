import 'package:app_delivey_food/core/helper/get_dummy_product_entitiy.dart';
import 'package:app_delivey_food/features/favorites/presentation/views/widgets/favorite_product_list_view.dart';
import 'package:flutter/material.dart';


class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FavoriteProductListView(products: [...getListDummyProduct()]),
    );
  }
}