part of 'add_order_cubit.dart';

sealed class AddOrderState extends Equatable {
  const AddOrderState();

  @override
  List<Object> get props => [];
}

final class AddOrderInitial extends AddOrderState {}

//create all state of add order;

final class AddOrderLoading extends AddOrderState {}

final class AddOrderError extends AddOrderState {
  final String message;
  const AddOrderError(this.message);
}

final class AddOrderSuccess extends AddOrderState {}
