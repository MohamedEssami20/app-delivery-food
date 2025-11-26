import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class DetailsProductImageList extends StatelessWidget {
  const DetailsProductImageList({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.5,
      child: PageView.builder(
        controller: pageController,
        padEnds: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                Assets.assetsImagesBurgerProduct,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
