import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/product_description.dart';
import 'package:app_delivey_food/features/home/presentation/views/widgets/product_price_and_add_tocart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cart/presentation/manager/cart_cubit/cart_cubit.dart';
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
  int productQuantity = 1;
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
          ProductNameAndCounter(
            counter: productQuantity,
            onIcrement: () => setState(() => productQuantity++),
            onDecrement: () =>
                setState(() => productQuantity > 1 ? productQuantity-- : null),
          ),
          ProductDescription(),
          const Spacer(),
          Expanded(
            flex: 2,
            child: ProductPriceAndAddToCart(
              productEntity: widget.productEntity,
              onPressed: () {
                context.read<CartCubit>().addProductToCart(
                  product: widget.productEntity,
                  quantity: productQuantity,
                );
              },
            ),
          ),
          // const SizedBox(height: 20),
        ],
      ),
    );
  }
}
