import 'package:app_delivey_food/features/orders/domain/repos/orders_repos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cancel_order_state.dart';

class CancelOrderCubit extends Cubit<CancelOrderState> {
  CancelOrderCubit({required this.ordersRepos}) : super(CancelOrderInitial());
  final OrdersRepos ordersRepos;

  // create method that cancel order;
  void cancelOrder({required int orderId, required String reason}) async {
    emit(CancelOrderLoading());
    final result = await ordersRepos.cancelOrder(
      orderId: orderId,
      reason: reason,
    );
    result.fold(
      (l) => emit(CancelOrderError(message: l.errorMessage)),
      (r) => emit(CancelOrderSuccess()),
    );
  }
}
