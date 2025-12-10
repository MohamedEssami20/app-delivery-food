import 'package:app_delivey_food/features/explore_products/presentation/views/widgets/explore_products_view_body.dart';
import 'package:flutter/material.dart';

class ExplorePrductsView extends StatelessWidget {
  const ExplorePrductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ExploreProductsViewBody());
  }
}
