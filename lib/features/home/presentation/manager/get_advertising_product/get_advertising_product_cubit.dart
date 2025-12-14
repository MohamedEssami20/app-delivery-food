
import 'package:app_delivey_food/features/home/domain/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/product_entity.dart';

part 'get_advertising_product_state.dart';

class GetAdvertisingProductCubit extends Cubit<GetAdvertisingProductState> {
  GetAdvertisingProductCubit({required this.homeRepo})
    : super(GetAdvertisingProductInitial());

  final HomeRepo homeRepo;

  //create method that get advertising product;
  Future<void> getAdvertisingProduct() async {
    emit(GetAdvertisingProductLoading());
    final result = await homeRepo.getAdvertiseProducts();
    result.fold(
      (l) => emit(GetAdvertisingProductFailure(errorMessage: l.errorMessage)),
      (r) => emit(GetAdvertisingProductSuccess(products: r)),
    );
  }
}
