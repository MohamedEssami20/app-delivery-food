part of 'get_products_cubit.dart';

@immutable
sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

// create all state to get products;
final class GetProductsSuccess extends GetProductsState {
  final List<ProductEntity> productsEntity;
  GetProductsSuccess({required this.productsEntity});
}

final class GetProductsFailure extends GetProductsState {
  final String errorMessage;
  GetProductsFailure({required this.errorMessage});
}

final class GetProductsLoading extends GetProductsState {}
