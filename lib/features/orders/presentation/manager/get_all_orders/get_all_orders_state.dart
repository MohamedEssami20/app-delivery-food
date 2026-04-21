part of 'get_all_orders_cubit.dart';

sealed class GetAllOrdersState extends Equatable {
  const GetAllOrdersState();

  @override
  List<Object> get props => [];
}

final class GetAllOrdersInitial extends GetAllOrdersState {}

// create all state of get all orders
final class GetAllOrdersLoading extends GetAllOrdersState {}

final class GetAllOrdersSuccess extends GetAllOrdersState {
  final List<MyOrderEntity> orders;
  const GetAllOrdersSuccess({required this.orders});
}

final class GetAllOrdersFailure extends GetAllOrdersState {
  final String errorMessage;
  const GetAllOrdersFailure({required this.errorMessage});
}
