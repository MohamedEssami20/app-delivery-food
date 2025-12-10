import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class FoodTypeSection extends StatelessWidget {
  const FoodTypeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 18,
        children: [
          Image.asset(
            Assets.assetsImagesIndianFood,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Image.asset(
            Assets.assetsImagesDessertFood,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Image.asset(
            Assets.assetsImagesFastFood,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Image.asset(
            Assets.assetsImagesSeaFood,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
