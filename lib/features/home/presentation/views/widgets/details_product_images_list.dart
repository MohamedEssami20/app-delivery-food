import 'package:app_delivey_food/core/helper/custom_network_image.dart';
import 'package:flutter/material.dart';

class DetailsProductImageList extends StatelessWidget {
  const DetailsProductImageList({
    super.key,
    required this.pageController,
    required this.productImages,
  });
  final PageController pageController;
  final List<dynamic> productImages;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.45,
      child: PageView.builder(
        controller: pageController,
        padEnds: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomNetowrkImage(imageUrl: productImages[index]),
            ),
          );
        },
        itemCount: productImages.length,
      ),
    );
  }
}
