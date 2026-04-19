import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/product_entity.dart';
import '../../../domain/repos/favorites_repo.dart';

part 'get_favorites_state.dart';

class GetFavoritesCubit extends Cubit<GetFavoritesState> {
  GetFavoritesCubit({required this.favoritesRepo})
      : super(GetFavoritesInitial());

  final FavoritesRepo favoritesRepo;

  // create method that get all favorite products;
  Future<void> getFavoriteProducts() async {
    emit(GetFavoritesLoading());
    final result = await favoritesRepo.getFavoriteProducts();
    result.fold(
      (failure) => emit(GetFavoritesFailure(errorMessage: failure.errorMessage)),
      (products) => emit(GetFavoritesSuccess(products: products)),
    );
  }

  // create method that remove product from current list without re-fetching;
  void removeProductFromList({required String productId}) {
    final currentState = state;
    if (currentState is GetFavoritesSuccess) {
      final updatedProducts = currentState.products
          .where((p) => p.id != productId)
          .toList();
      emit(GetFavoritesSuccess(products: updatedProducts));
    }
  }
}
