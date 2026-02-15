part of 'get_order_status_cubit.dart';

sealed class GetOrderStatusState extends Equatable {
  const GetOrderStatusState();

  @override
  List<Object> get props => [];
}

final class GetOrderStatusInitial extends GetOrderStatusState {}

// create all state to get order status;
final class GetOrderStatusSuccess extends GetOrderStatusState {
  const GetOrderStatusSuccess({required this.orderStatus});
  final String orderStatus;
}

final class GetOrderStatusFailed extends GetOrderStatusState {
  const GetOrderStatusFailed({required this.errorMessage});
  final String errorMessage;
}

final class GetOrderStatusLoading extends GetOrderStatusState {}
