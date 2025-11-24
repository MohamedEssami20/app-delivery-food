import 'package:app_delivey_food/core/helper/category_prdoucts_item.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/category_products_item.dart';
import 'package:flutter/material.dart';

class CategoryItemsList extends StatefulWidget {
  const CategoryItemsList({super.key});

  @override
  State<CategoryItemsList> createState() => _CategoryItemsListState();
}

class _CategoryItemsListState extends State<CategoryItemsList> {
  bool isSelected = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CategoryItem(
            isActive: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            title: CategoryPrdouctsItem.getCategoryItems()[index],
          ),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: CategoryPrdouctsItem.getCategoryItems().length,
      ),
    );
  }
}
