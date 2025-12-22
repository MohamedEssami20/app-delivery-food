import 'dart:developer';

import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/features/cart/domain/entities/cart_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartCubitInitial());

  CartEntity cartEntityList = CartEntity(cartItemList: []);

  void addProductToCart({
    required ProductEntity product,
    required int quantity,
  }) {
    emit(AddProductToCartLoading());
    try {
      final isProductInCart = cartEntityList.isProductInCart(product);
      CartItemEntity cartItem = cartEntityList.getCartItemByProductId(
        product,
        quantity,
      );
      log("get cart item 1= ${cartItem.toString()}");
      if (isProductInCart) {
        cartItem.incrementQuantity(counter: quantity);
        log("icrement cart item 1= ${cartItem.quantity}");
      } else {
        cartEntityList.addProduct(cartItem);
        log("cart Entity length = ${cartEntityList.cartItemList.length}");
      }
      emit(AddProductToCartSuccess());
    } catch (e) {
      emit(AddProductToCartError(errorMessage: e.toString()));
    }
  }

  void removeProductFromCart(CartItemEntity product) {
    emit(RemoveProductFromCartLoading());
    try {
      cartEntityList.removeProduct(product);
      emit(RemoveProductFromCartSuccess());
    } catch (e) {
      emit(RemoveProductFromCartError(errorMessage: e.toString()));
    }
  }
}
