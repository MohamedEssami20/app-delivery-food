part of 'favorite_cubit.dart';

sealed class FavoriteFoodState extends Equatable {
  const FavoriteFoodState();

  @override
  List<Object> get props => [];
}

final class AddFavoriteInitial extends FavoriteFoodState {}

// create state that update favorite;

final class UpdateFavoriteState extends FavoriteFoodState {}

// create all state to add favorite;

final class AddFavoriteLoading extends FavoriteFoodState {
  final String foodId;
  const AddFavoriteLoading({required this.foodId});

  @override
  List<Object> get props => [foodId];
}

final class AddFavoriteError extends FavoriteFoodState {
  final String foodId;
  final String errorMessage;
  const AddFavoriteError({required this.foodId, required this.errorMessage});

  @override
  List<Object> get props => [foodId, errorMessage];
}

final class AddFavoriteSuccess extends FavoriteFoodState {
  final String foodId;
  const AddFavoriteSuccess({required this.foodId});

  @override
  List<Object> get props => [foodId];
}

// create all state to remove favorite;

final class RemoveFavoriteLoading extends FavoriteFoodState {
  final String foodId;
  const RemoveFavoriteLoading({required this.foodId});

  @override
  List<Object> get props => [foodId];
}

final class RemoveFavoriteError extends FavoriteFoodState {
  final String foodId;
  final String errorMessage;
  const RemoveFavoriteError({required this.foodId, required this.errorMessage});

  @override
  List<Object> get props => [foodId, errorMessage];
}

final class RemoveFavoriteSuccess extends FavoriteFoodState {
  final String foodId;
  const RemoveFavoriteSuccess({required this.foodId});

  @override
  List<Object> get props => [foodId];
}
