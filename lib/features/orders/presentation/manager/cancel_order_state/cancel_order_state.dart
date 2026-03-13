part of 'cancel_order_cubit.dart';

sealed class CancelOrderState extends Equatable {
  const CancelOrderState();

  @override
  List<Object> get props => [];
}

final class CancelOrderInitial extends CancelOrderState {}

// create all state to cancel order;
final class CancelOrderSuccess extends CancelOrderState {}

final class CancelOrderError extends CancelOrderState {
  final String message;
  const CancelOrderError({required this.message});
}

final class CancelOrderLoading extends CancelOrderState {}
