part of 'search_products_cubit.dart';

sealed class SearchProductsState extends Equatable {
  const SearchProductsState();

  @override
  List<Object> get props => [];
}

final class SearchProductsInitial extends SearchProductsState {}

// create all state of search products;
final class SearchProductsLoading extends SearchProductsState {}

final class SearchProductsSuccess extends SearchProductsState {
  final List<ProductEntity> products;
  const SearchProductsSuccess({required this.products});
  @override
  List<Object> get props => [products];
}

final class SearchProductsFailure extends SearchProductsState {
  final String errormessage;
  const SearchProductsFailure({required this.errormessage});
  @override
  List<Object> get props => [errormessage];
}

// create state of store query for search products;
final class StoreQuerySuccess extends SearchProductsState {
  final String query;
  const StoreQuerySuccess({required this.query});
  @override
  List<Object> get props => [query];
}

final class StoreQueryFailure extends SearchProductsState {
  final String errormessage;
  const StoreQueryFailure({required this.errormessage});
  @override
  List<Object> get props => [errormessage];
}

final class StoreQueryLoading extends SearchProductsState {
  const StoreQueryLoading();
}

// create all state of get search query;
final class GetSearchQuerySuccess extends SearchProductsState {
  final List<String?> query;
  const GetSearchQuerySuccess({required this.query});
  @override
  List<Object> get props => [query];
}

final class GetSearchQueryFailure extends SearchProductsState {
  final String errormessage;
  const GetSearchQueryFailure({required this.errormessage});
  @override
  List<Object> get props => [errormessage];
}

final class GetSearchQueryLoading extends SearchProductsState {
  const GetSearchQueryLoading();
}

//create all state of delete search query;
final class DeleteSearchQuerySuccess extends SearchProductsState {
  const DeleteSearchQuerySuccess();
}

final class DeleteSearchQueryFailure extends SearchProductsState {
  final String errormessage;
  const DeleteSearchQueryFailure({required this.errormessage});
  @override
  List<Object> get props => [errormessage];
}

final class DeleteSearchQueryLoading extends SearchProductsState {
  const DeleteSearchQueryLoading();
}
