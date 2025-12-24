part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartCubitInitial extends CartState {}

final class AddProductToCartError extends CartState {
  final String errorMessage;
  const AddProductToCartError({required this.errorMessage});
}

final class RemoveProductFromCartError extends CartState {
  final String errorMessage;
  const RemoveProductFromCartError({required this.errorMessage});
}

final class CartLoaded extends CartState {
  final CartEntity cartEntity;
  final CartAction ?cartAction;
  const CartLoaded({required this.cartEntity,  this.cartAction});

  @override
  List<Object> get props => [cartEntity];
}

