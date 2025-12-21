import 'package:app_delivey_food/features/cart/domain/entities/cart_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/cart_item_entity.dart';

part 'cart_cubit_state.dart';

class CartCubitCubit extends Cubit<CartCubitState> {
  CartCubitCubit() : super(CartCubitInitial());

  CartEntity cartEntityList = CartEntity(cartItemList: []);

  void addProductToCart(CartItemEntity product) {
    emit(AddProductToCartLoading());
    try {
      final isProductInCart = cartEntityList.isProductInCart(
      product.productEntity,
    );
    if (isProductInCart) {
      CartItemEntity cartItem = cartEntityList.getCartItemByProductId(
        product.productEntity.id,
      );
      cartItem.incrementQuantity();
    } else {
      cartEntityList.addProduct(product);
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
