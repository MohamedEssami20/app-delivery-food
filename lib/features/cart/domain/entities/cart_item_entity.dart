import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;
  CartItemEntity({required this.productEntity, this.quantity = 1});

  void incrementQuantity({int? counter}) {
    if (counter != null) {
      quantity += counter;
    } else {
      quantity++;
    }
  }

  void decrementQuantity() {
    quantity--;
  }

  num calculateTotalPrice() {
    int currentPrice = int.parse(productEntity.price);
    double discountValue = productEntity.discount / 100;
    double discount = currentPrice * discountValue;
    double totalPrice = (currentPrice - discount) * quantity;
    return totalPrice;
  }

  @override
  List<Object?> get props => [productEntity, quantity];
}
