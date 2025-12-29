import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';
import 'package:app_delivey_food/features/checkout/data/models/cart_product_model.dart';
import 'package:app_delivey_food/features/checkout/domain/entities/address_input_entity.dart';

class AddressInputModel {
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
  final List<CartItemEntity> cartItemEntityList;
  AddressInputModel({
    required this.name,
    required this.email,
    required this.country,
    required this.city,
    required this.street,
    required this.apartmentNumber,
    required this.houseNumber,
    required this.phoneNumber,
    required this.dateTime,
    required this.cartItemEntityList,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'country': country,
      'city': city,
      'street': street,
      'apartmentNumber': apartmentNumber,
      'houseNumber': houseNumber,
      'phoneNumber': phoneNumber,
      'dateTime': dateTime.toIso8601String(),
      'totalPrice': totalPrice,
      'products': cartItemEntityList.map((x) {
        return CartProductModel.fromCartItemEnity(x).toMap();
      }).toList(),
    };
  }

  factory AddressInputModel.fromMap(Map<String, dynamic> map) {
    return AddressInputModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      country: map['country'] ?? '',
      city: map['city'] ?? '',
      totalPrice: map['totalPrice'] ?? 0,
      street: map['street'] ?? '',
      apartmentNumber: map['apartmentNumber']?.toInt() ?? 0,
      houseNumber: map['houseNumber']?.toInt() ?? 0,
      phoneNumber: map['phoneNumber']?.toInt() ?? 0,
      dateTime: DateTime.parse(map['dateTime'] ?? ''),
      cartItemEntityList: List<CartItemEntity>.from(
        map['products']?.map((x) => CartProductModel.fromJson(x)),
      ),
    );
  }

  AddressInputEntity toEntity() => AddressInputEntity(
    name: name,
    email: email,
    country: country,
    city: city,
    street: street,
    apartmentNumber: apartmentNumber,
    houseNumber: houseNumber,
    phoneNumber: phoneNumber,
    dateTime: dateTime,
    cartItemEntity: cartItemEntityList,
    totalPrice: totalPrice,
  );

  factory AddressInputModel.fromEntity(AddressInputEntity entity) =>
      AddressInputModel(
        name: entity.name,
        email: entity.email,
        country: entity.country,
        city: entity.city,
        street: entity.street,
        apartmentNumber: entity.apartmentNumber,
        houseNumber: entity.houseNumber,
        phoneNumber: entity.phoneNumber,
        dateTime: entity.dateTime,
        cartItemEntityList: entity.cartItemEntity,
        totalPrice: entity.totalPrice,
      );
}
