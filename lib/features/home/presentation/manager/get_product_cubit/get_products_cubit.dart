import 'package:app_delivey_food/features/home/domain/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/entities/product_entity.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit({required this.homeRepo}) : super(GetProductsInitial());
  final HomeRepo homeRepo;

  // create method that get all products of category;
  Future<void> getProductsOfCategory({required int category}) async {
    emit(GetProductsLoading());
    final result = await homeRepo.getProducts(category: category);
    result.fold(
      (faliure) => emit(GetProductsFailure(errorMessage: faliure.errorMessage)),
      (products) => emit(GetProductsSuccess(productsEntity: products)),
    );
  }
}
