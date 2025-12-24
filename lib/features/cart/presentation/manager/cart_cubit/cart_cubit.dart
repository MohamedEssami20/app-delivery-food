import 'dart:developer';

import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/features/cart/domain/entities/cart_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/cart_action.dart';
import '../../../domain/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartLoaded(cartEntity: CartEntity(cartItemList: [])));

  // create method that add product to cart;
  void addProductToCart({
    required ProductEntity product,
    required int quantity,
  }) {
    try {
      final currentSate = state;
      if (currentSate is! CartLoaded) return;
      final currentItem = List<CartItemEntity>.from(
        currentSate.cartEntity.cartItemList,
      );

      final index = currentItem.indexWhere(
        (element) => element.productEntity.id == product.id,
      );

      if (index != -1) {
        final oldItem = currentItem[index];
        currentItem[index] = CartItemEntity(
          productEntity: product,
          quantity: oldItem.quantity + quantity,
        );
      } else {
        currentItem.add(
          CartItemEntity(productEntity: product, quantity: quantity),
        );
      }

      final updateCart = CartEntity(cartItemList: currentItem);
      emit(CartLoaded(cartEntity: updateCart, cartAction: CartAction.add));
    } catch (e) {
      AddProductToCartError(errorMessage: e.toString());
      log("Exception in add product to cart= ${e.toString()}");
    }
  }

  //create method that remove product from cart item;
  void removeProductFromCart(CartItemEntity product) {
    try {
      final currentState = state;
      if (currentState is! CartLoaded) return;
      final currentItem = List<CartItemEntity>.from(
        currentState.cartEntity.cartItemList,
      );

      currentItem.removeWhere(
        (element) => element.productEntity.id == product.productEntity.id,
      );
      final updateCart = CartEntity(cartItemList: currentItem);
      emit(CartLoaded(cartEntity: updateCart, cartAction: CartAction.remove));
    } catch (e) {
      emit(RemoveProductFromCartError(errorMessage: e.toString()));
      log("Exception in remove product from cart= ${e.toString()}");
    }
  }

  void incrementQuantity(CartItemEntity item) {
    final currentState = state;
    if (currentState is! CartLoaded) return;

    final items = List<CartItemEntity>.from(
      currentState.cartEntity.cartItemList,
    );

    final index = items.indexWhere(
      (e) => e.productEntity.id == item.productEntity.id,
    );

    if (index != -1) {
      items[index] = CartItemEntity(
        productEntity: items[index].productEntity,
        quantity: items[index].quantity + 1,
      );
    }

    emit(CartLoaded(cartEntity: CartEntity(cartItemList: items)));
  }

  void decrementQuantity(CartItemEntity item) {
    final currentState = state;
    if (currentState is! CartLoaded) return;

    final items = List<CartItemEntity>.from(
      currentState.cartEntity.cartItemList,
    );

    final index = items.indexWhere(
      (e) => e.productEntity.id == item.productEntity.id,
    );

    if (index != -1) {
      if (items[index].quantity > 1) {
        items[index] = CartItemEntity(
          productEntity: items[index].productEntity,
          quantity: items[index].quantity - 1,
        );
      } else {
        items.removeAt(index);
      }
    }

    emit(CartLoaded(cartEntity: CartEntity(cartItemList: items)));
  }
}
