import 'package:flutter/material.dart';
import 'details_product_images_list.dart';
import 'dots_indicator_list.dart';
import 'product_name_and_counter.dart';
import 'product_rating_and_calorey.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key});

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  late PageController pageController;
  int selectedIndex = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      setState(() {
        selectedIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 8,
        children: [
          DetailsProductImageList(pageController: pageController),
          DotsIndicatorList(currentIndex: selectedIndex),
          const ProductRatingAndCalorey(),
          const SizedBox(height: 8),
          const ProductNameAndCounter(),
        ],
      ),
    );
  }
}
