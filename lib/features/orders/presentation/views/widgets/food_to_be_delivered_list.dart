import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helper/app_theme_helper.dart';
import 'food_to_be_delivered_item.dart';

class FoodTobeDeliveredList extends StatelessWidget {
  const FoodTobeDeliveredList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          "Food to be delivered",
          style: AppThemeHelper(context).textStyles.labelLarge?.copyWith(
            color: AppThemeHelper(context).colors.typography300,
          ),
        ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child:  FoodToBeDeliveredItem(
                image:  cartItems[index].productEntity.baseImageUrl,
                quantity: cartItems[index].quantity,
              ),
            ),
            itemCount: cartItems.length,
          ),
        ),
      ],
    );
  }
}
