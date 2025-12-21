import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;
  CartItemEntity({required this.productEntity, this.quantity = 1});

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    quantity--;
  }

  num calculateTotalPrice() {
    int currentPrice = int.parse(productEntity.price);
    double totalPrice = (currentPrice * quantity).toDouble();
    return totalPrice;
  }

  @override
  List<Object?> get props => [productEntity, quantity];
}
