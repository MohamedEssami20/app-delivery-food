import 'dart:async';

import 'package:app_delivey_food/features/orders/domain/repos/orders_repos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_order_status_state.dart';

class GetOrderStatusCubit extends Cubit<GetOrderStatusState> {
  GetOrderStatusCubit({required this.ordersRepo})
    : super(GetOrderStatusInitial());
  final OrdersRepos ordersRepo;
  StreamSubscription? streamSubscription;

  // create method that get order status;
  Future<void> getOrderStatus({required int orderId}) async {
    emit(GetOrderStatusLoading());
    streamSubscription = ordersRepo.getOrders(orderId: orderId).listen((event) {
      event.fold(
        (l) => emit(GetOrderStatusFailed(errorMessage: l.errorMessage)),
        (r) => emit(GetOrderStatusSuccess(orderStatus: r)),
      );
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
