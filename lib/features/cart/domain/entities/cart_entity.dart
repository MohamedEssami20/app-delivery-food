
import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> products;

  CartEntity({
    required this.products,
  });

  void addProduct(CartItemEntity product) {
    products.add(product);
  }

  void removeProduct(CartItemEntity product) {
    products.remove(product);
  }
  
  // method that claculate total price in cart
  num calculateTotalPrice() {
    num totalPrice = 0;
    for (var product in products) {
      totalPrice += product.calculateTotalPrice();
    }
    return totalPrice;
  }

  bool isProductInCart(ProductEntity product) {
    for (var item in products) {
      if (item.productEntity.id == product.id) {
        return true;
      }
    }
    return false;
  }
}
