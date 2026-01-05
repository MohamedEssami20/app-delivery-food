import 'package:app_delivey_food/features/checkout/domain/repos/checkout_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/address_input_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit({required this.checkoutRepol}) : super(AddOrderInitial());
  final CheckoutRepo checkoutRepol;

  // create method that add order;
  void addOrder({
    required AddressAndOrderInputEntity addressInputEntity,
  }) async {
    emit(AddOrderLoading());
    final result = await checkoutRepol.addOreder(
      addressInputEntity: addressInputEntity,
    );
    result.fold(
      (l) => emit(AddOrderError(l.errorMessage)),
      (r) => emit(AddOrderSuccess()),
    );
  }
}
