import 'package:app_delivey_food/core/helper/get_dummy_product_entitiy.dart';
import 'package:app_delivey_food/features/search/presentation/views/widgets/search_product_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: SearchProductListView(products: getListDummyProduct())),
      ],
    );
  }
}
