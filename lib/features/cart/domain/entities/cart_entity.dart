import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItemList;

  CartEntity({required this.cartItemList});

  void addProduct(CartItemEntity product) {
    cartItemList.add(product);
  }

  void removeProduct(CartItemEntity product) {
    cartItemList.remove(product);
  }

  // method that claculate total price in cart
  num calculateTotalPrice() {
    num totalPrice = 0;
    for (var product in cartItemList) {
      totalPrice += product.calculateTotalPrice();
    }
    return totalPrice.toDouble();
  }

  bool isProductInCart(ProductEntity product) {
    for (var item in cartItemList) {
      if (item.productEntity.id == product.id) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItemByProductId(ProductEntity product, int quantity) {
    for (var item in cartItemList) {
      if (item.productEntity.id == product.id) {
        return item;
      }
    }
    return CartItemEntity(productEntity: product, quantity: quantity);
  }
}
