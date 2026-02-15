import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';

class OrderPlacedArgs {
  final List<CartItemEntity> cartItems;
  final int orderId;

  OrderPlacedArgs({required this.cartItems, required this.orderId});
}