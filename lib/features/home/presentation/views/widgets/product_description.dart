import 'package:flutter/material.dart';

import '../../../../../core/helper/app_theme_helper.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "A classic favorite! Indulge in a crispy, thin crust topped with rich tomato sauce, layers of gooey mozzarella cheese, and delicious pepperoni slices. Perfectly baked with a hint of herbs for a mouth-watering experience in every bite. ",
            style: AppThemeHelper(context).textStyles.labelSmall!.copyWith(
              color: AppThemeHelper(context).colors.typography400,
            ),
          ),
        ],
      ),
    );
  }
}
