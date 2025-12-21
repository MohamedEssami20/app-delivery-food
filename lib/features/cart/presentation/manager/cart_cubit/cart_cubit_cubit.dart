import 'package:app_delivey_food/core/entities/product_entity.dart';
import 'package:app_delivey_food/features/cart/domain/entities/cart_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/cart_item_entity.dart';

part 'cart_cubit_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartCubitInitial());

  CartEntity cartEntityList = CartEntity(cartItemList: []);

  void addProductToCart({required ProductEntity product}) {
    emit(AddProductToCartLoading());
    try {
      final isProductInCart = cartEntityList.isProductInCart(product);
      CartItemEntity cartItem = cartEntityList.getCartItemByProductId(product);
      if (isProductInCart) {
        cartItem.incrementQuantity();
      } else {
        cartEntityList.addProduct(cartItem);
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
