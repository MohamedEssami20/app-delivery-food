part of 'get_advertising_product_cubit.dart';

sealed class GetAdvertisingProductState extends Equatable {
  const GetAdvertisingProductState();

  @override
  List<Object> get props => [];
}

final class GetAdvertisingProductInitial extends GetAdvertisingProductState {}

// create all state to get advertising product;
final class GetAdvertisingProductSuccess extends GetAdvertisingProductState {
  final List<AdvertisingProductEntity> products;
  const GetAdvertisingProductSuccess({required this.products});
}

final class GetAdvertisingProductFailure extends GetAdvertisingProductState {
  final String errorMessage;
  const GetAdvertisingProductFailure({required this.errorMessage});
}

final class GetAdvertisingProductLoading extends GetAdvertisingProductState {}