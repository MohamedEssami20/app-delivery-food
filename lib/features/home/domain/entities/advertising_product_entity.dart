
import 'package:cloud_firestore/cloud_firestore.dart';

class AdvertisingProductEntity {
  final String id;
  final String name;
  final String description;
  final String price;
  final num productDiscount;
  final String productType;
  final num avrageRating;
  final bool? isFavourite;
  final String? baseImageUrl;
  final List<dynamic>? productImageUrls;
  final num calories;
  final Timestamp? createdAt;

  AdvertisingProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.productType,
    required this.avrageRating,
    this.isFavourite = false,
    required this.calories,
    this.createdAt,
    this.baseImageUrl,
    this.productImageUrls, required this.productDiscount,
  });

  // create copy with function
  AdvertisingProductEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? price,
    String? productType,
    num? avrageRating,
    bool? isFavourite,
    String? baseImageUrl,
    List<dynamic>? productImageUrls,
    num? calories,
    Timestamp? createdAt,
    num? productDiscount
  }) {
    return AdvertisingProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      productDiscount: productDiscount ?? this.productDiscount,
      productType: productType ?? this.productType,
      avrageRating: avrageRating ?? this.avrageRating,
      isFavourite: isFavourite ?? this.isFavourite,
      baseImageUrl: baseImageUrl ?? this.baseImageUrl,
      productImageUrls: productImageUrls ?? this.productImageUrls,
      calories: calories ?? this.calories,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
