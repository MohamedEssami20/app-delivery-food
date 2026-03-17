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
  String? currentFavoriteFoodId;
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

    if (merged.length == _favoritedFoodsIds.length &&
        _favoritedFoodsIds.containsAll(merged)) {
      return;
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
    currentFavoriteFoodId = foodId;
    emit(AddFavoriteLoading(foodId: foodId));
    final result = await favoriteFoodRepos.addFavoriteFood(foodId: foodId);
    result.fold(
      (l) => emit(AddFavoriteError(errorMessage: l.errorMessage)),
      (r) => emit(AddFavoriteSuccess()),
    );
  }
}
