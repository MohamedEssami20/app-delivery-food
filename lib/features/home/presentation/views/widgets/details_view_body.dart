import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/product_description.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/product_price_and_add_tocart.dart';
import 'package:flutter/material.dart';
import 'details_product_images_list.dart';
import 'dots_indicator_list.dart';
import 'product_name_and_counter.dart';
import 'product_rating_and_calorey.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
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
        spacing: 12,
        children: [
          DetailsProductImageList(
            pageController: pageController,
            productImages: widget.productEntity.productImageUrls,
          ),
          DotsIndicatorList(currentIndex: selectedIndex),
          ProductRatingAndCalorey(product: widget.productEntity),
          const ProductNameAndCounter(),
          ProductDescription(),
          const Spacer(),
          Expanded(
            flex: 2,
            child: ProductPriceAndAddToCart(price: widget.productEntity.price),
          ),
          // const SizedBox(height: 20),
        ],
      ),
    );
  }
}
