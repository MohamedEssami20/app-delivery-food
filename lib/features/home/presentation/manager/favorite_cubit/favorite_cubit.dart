import 'dart:developer';

import 'package:app_delivey_food/features/home/domain/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import '../../../../../core/entities/product_entity.dart';

part 'favorite_state.dart';

class FavoriteFoodCubit extends Cubit<FavoriteFoodState> {
  FavoriteFoodCubit({required this.favoriteFoodRepos})
      : super(AddFavoriteInitial());

  final HomeRepo favoriteFoodRepos;
  final Set<String> _favoritedFoodsIds = {};

  Set<String> get favoriteFoods => Set.unmodifiable(_favoritedFoodsIds);

  // create method that add favorite food when load data;

  Future<void> loadFavoriteFoods(List<ProductEntity> products) async {
    final favoriteIds = products
        .where((p) => p.isFavourite)
        .map((p) => p.id)
        .toSet();

    final merged = <String>{}
      ..addAll(_favoritedFoodsIds)
      ..addAll(favoriteIds);

    if (merged.length == _favoritedFoodsIds.length) {
      return; // No new favorites added
    }
    
    _favoritedFoodsIds
      ..clear()
      ..addAll(merged);
      
    log("favorite ids = ${_favoritedFoodsIds.toString()}");
    emit(UpdateFavoriteState());
  }

  //create method that add favorite food;

  Future<void> addFavoriteFood({required String foodId}) async {
    if (_favoritedFoodsIds.contains(foodId)) {
      return;
    }
    
    emit(AddFavoriteLoading(foodId: foodId));
    final result = await favoriteFoodRepos.addFavoriteFood(foodId: foodId);
    
    result.fold(
      (failure) => emit(AddFavoriteError(foodId: foodId, errorMessage: failure.errorMessage)),
      (_) {
        _favoritedFoodsIds.add(foodId);
        emit(AddFavoriteSuccess(foodId: foodId));
      },
    );
  }

  // create method that remove favorite food;

  Future<void> removeFavoriteFood({required String foodId}) async {
    if (!_favoritedFoodsIds.contains(foodId)) {
      return;
    }
    
    emit(RemoveFavoriteLoading(foodId: foodId));
    final result = await favoriteFoodRepos.removeFavoriteFood(foodId: foodId);
    
    result.fold(
      (failure) => emit(RemoveFavoriteError(foodId: foodId, errorMessage: failure.errorMessage)),
      (_) {
        _favoritedFoodsIds.remove(foodId);
        emit(RemoveFavoriteSuccess(foodId: foodId));
      },
    );
  }

  // create method that check if food is favorite

  bool isFavorite(String foodId) {
    return _favoritedFoodsIds.contains(foodId);
  }
}
