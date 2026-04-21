import 'package:app_delivey_food/core/helper/order_state.dart';
import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';
import 'package:app_delivey_food/features/checkout/data/models/cart_product_model.dart';
import 'package:app_delivey_food/features/orders/domain/entities/my_order_entity.dart';

class MyOrderModel extends MyOrderEntity {
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
  final List<CartItemEntity> cartItemEntityList;
  final String orderState;
  MyOrderModel({
    required this.id,
    required this.userId,
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
    required this.orderState,
  }) : super(
         orderId: '',
         status: '',
         dateOrTimeTitle: '',
         dateOrTimeValue: '',
         summary: '',
         orderTotalPrice: 0.0,
         mainImage: '',
         extraImages: [],
         isCurrent: false,
       );

  factory MyOrderModel.fromMap(Map<String, dynamic> map) {
    return MyOrderModel(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId'] ?? '',
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
      orderState: map['orderState'] ?? '',
      cartItemEntityList: List<CartItemEntity>.from(
        map['products']?.map(
          (x) => CartProductModel.fromJson(x).toCartItemEntity(),
        ),
      ),
    );
  }

  MyOrderEntity toEntity() => MyOrderEntity(
    orderId: id.toString(),
    status: orderState,
    dateOrTimeTitle: dateTime.toString().split(' ')[0],
    dateOrTimeValue: dateTime.toString().split(' ')[1].substring(0, 5),
    summary: cartItemEntityList.first.productEntity.description.substring(
      0,
      10,
    ),
    orderTotalPrice: totalPrice.toDouble(),
    mainImage: cartItemEntityList.isNotEmpty
        ? cartItemEntityList.first.productEntity.baseImageUrl
        : "",
    extraImages: cartItemEntityList.isNotEmpty
        ? cartItemEntityList
              .expand((e) => e.productEntity.productImageUrls)
              .toList()
        : [],
    isCurrent:
        orderState == OrderState.delivered.name ||
            orderState == OrderState.cancelled.name
        ? false
        : true,
  );
}
