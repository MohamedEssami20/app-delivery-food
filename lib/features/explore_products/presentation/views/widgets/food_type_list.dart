import 'package:flutter/material.dart';

import 'food_type_item.dart';

class FoodTypeListView extends StatelessWidget {
  const FoodTypeListView({super.key});

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
        itemCount: 10,
        itemBuilder: (context, index) => FoodTypeItem(),
      ),
    );
  }
}
