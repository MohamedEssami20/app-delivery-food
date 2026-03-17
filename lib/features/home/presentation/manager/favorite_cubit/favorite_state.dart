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
}

final class AddFavoriteError extends FavoriteFoodState {
  final String errorMessage;
  const AddFavoriteError({required this.errorMessage});
}

final class AddFavoriteSuccess extends FavoriteFoodState {}
