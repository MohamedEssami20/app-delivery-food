part of 'cart_cubit_cubit.dart';

sealed class CartCubitState extends Equatable {
  const CartCubitState();

  @override
  List<Object> get props => [];
}

final class CartCubitInitial extends CartCubitState {}

final class AddProductToCartLoading extends CartCubitState {}

final class AddProductToCartSuccess extends CartCubitState {}

final class AddProductToCartError extends CartCubitState {
  final String errorMessage;
  const AddProductToCartError({required this.errorMessage});
}

final class RemoveProductFromCartLoading extends CartCubitState {}

final class RemoveProductFromCartSuccess extends CartCubitState {}

final class RemoveProductFromCartError extends CartCubitState {
  final String errorMessage;
  const RemoveProductFromCartError({required this.errorMessage});
}
