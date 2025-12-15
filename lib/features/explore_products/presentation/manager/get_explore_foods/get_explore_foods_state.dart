part of 'get_explore_foods_cubit.dart';

sealed class GetExploreFoodsState extends Equatable {
  const GetExploreFoodsState();

  @override
  List<Object> get props => [];
}

final class GetExploreFoodsInitial extends GetExploreFoodsState {}

// create all state of get explore foods;
final class GetExploreFoodsSuccess extends GetExploreFoodsState {
  final List<ProductEntity> products;
  const GetExploreFoodsSuccess({required this.products});
}

final class GetExploreFoodsFailure extends GetExploreFoodsState {
  final String errorMessage;
  const GetExploreFoodsFailure({required this.errorMessage});
}

final class GetExploreFoodsLoading extends GetExploreFoodsState {}
