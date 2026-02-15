import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';

class AddressAndOrderInputEntity {
  final int id;
  final String userId;
  final String name;
  final String email;
  final String country;
  final String city;
  final String street;
  final num totalPrice;
  final int apartmentNumber;
  final int houseNumber;
  final int phoneNumber;
  final DateTime dateTime;
  final List<CartItemEntity> cartItemEntity;
  final String orderState;

  AddressAndOrderInputEntity({
    required this.id,
    required this.userId,
    required this.totalPrice,
    required this.name,
    required this.email,
    required this.country,
    required this.city,
    required this.street,
    required this.apartmentNumber,
    required this.houseNumber,
    required this.phoneNumber,
    required this.cartItemEntity,
    required this.dateTime,
    required this.orderState,
  });
}
