part of 'add_favorite_cubit.dart';

sealed class AddFavoriteState extends Equatable {
  const AddFavoriteState();

  @override
  List<Object> get props => [];
}

final class AddFavoriteInitial extends AddFavoriteState {}

// create all state to add favorite;

final class AddFavoriteLoading extends AddFavoriteState {}

final class AddFavoriteError extends AddFavoriteState {
  final String errorMessage;
  const AddFavoriteError({
    required this.errorMessage,
  });
}

final class AddFavoriteSuccess extends AddFavoriteState {}
