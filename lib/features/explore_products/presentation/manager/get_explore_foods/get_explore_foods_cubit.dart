import 'package:app_delivey_food/features/explore_products/entities/repos/explore_product_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/product_entity.dart';

part 'get_explore_foods_state.dart';

class GetExploreFoodsCubit extends Cubit<GetExploreFoodsState> {
  GetExploreFoodsCubit({required this.exploreProductRepo})
    : super(GetExploreFoodsInitial());

  final ExploreProductRepo exploreProductRepo;

  Future<void> getExploreFoods({required String category}) async {
    emit(GetExploreFoodsLoading());
    final result = await exploreProductRepo.getProductsOfCategory(
      category: category,
    );
    result.fold(
      (l) => emit(GetExploreFoodsFailure(errorMessage: l.errorMessage)),
      (r) => emit(GetExploreFoodsSuccess(products: r)),
    );
  }
}
