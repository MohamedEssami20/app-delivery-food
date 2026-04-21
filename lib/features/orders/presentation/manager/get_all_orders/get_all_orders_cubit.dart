import 'package:app_delivey_food/features/orders/domain/repos/orders_repos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/my_order_entity.dart';

part 'get_all_orders_state.dart';

class GetAllOrdersCubit extends Cubit<GetAllOrdersState> {
  GetAllOrdersCubit({required this.ordersRepos}) : super(GetAllOrdersInitial());
  final OrdersRepos ordersRepos;

  List<MyOrderEntity>? allOrders;
  Future<void> getAllOrders() async {
    emit(GetAllOrdersLoading());
    final result = await ordersRepos.getMyOrders();
    result.fold(
      (failure) {
        emit(GetAllOrdersFailure(errorMessage: failure.errorMessage));
      },
      (orders) {
        allOrders = orders;
        emit(GetAllOrdersSuccess(orders: orders));
      },
    );
  }
}
