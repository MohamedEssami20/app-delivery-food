import 'package:app_delivey_food/features/favorites/domain/favorite_food_repo/favorite_food_repos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import '../../../../../core/entities/product_entity.dart';

part 'add_favorite_state.dart';

class AddFavoriteCubit extends Cubit<AddFavoriteState> {
  AddFavoriteCubit({required this.favoriteFoodRepos})
    : super(AddFavoriteInitial());

  final FavoriteFoodRepos favoriteFoodRepos;
  //create method that add favorite food;

  Future<void> addFavoriteFood({required ProductEntity prductEntity}) async {
    emit(AddFavoriteLoading());
    final result = await favoriteFoodRepos.addFavoriteFood(
      prductEntity: prductEntity,
    );
    result.fold(
      (l) => emit(AddFavoriteError(errorMessage: l.errorMessage)),
      (r) => emit(AddFavoriteSuccess()),
    );
  }
}
