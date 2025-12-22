part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartCubitInitial extends CartState {}

final class AddProductToCartLoading extends CartState {}

final class AddProductToCartSuccess extends CartState {}

final class AddProductToCartError extends CartState {
  final String errorMessage;
  const AddProductToCartError({required this.errorMessage});
}

final class RemoveProductFromCartLoading extends CartState {}

final class RemoveProductFromCartSuccess extends CartState {}

final class RemoveProductFromCartError extends CartState {
  final String errorMessage;
  const RemoveProductFromCartError({required this.errorMessage});
}
