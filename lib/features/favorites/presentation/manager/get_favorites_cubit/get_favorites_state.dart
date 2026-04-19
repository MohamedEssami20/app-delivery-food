part of 'get_favorites_cubit.dart';

sealed class GetFavoritesState extends Equatable {
  const GetFavoritesState();

  @override
  List<Object> get props => [];
}

final class GetFavoritesInitial extends GetFavoritesState {}

// create all state for get favorites;

final class GetFavoritesLoading extends GetFavoritesState {}

final class GetFavoritesSuccess extends GetFavoritesState {
  final List<ProductEntity> products;
  const GetFavoritesSuccess({required this.products});

  @override
  List<Object> get props => [products];
}

final class GetFavoritesFailure extends GetFavoritesState {
  final String errorMessage;
  const GetFavoritesFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
