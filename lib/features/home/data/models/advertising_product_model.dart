
import 'package:app_delivey_food/features/home/domain/entities/advertising_product_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AdvertisingProductModel {
  final String id;
  final String name;
  final String description;
  final String price;
  final num productDiscount;
  final String productType;
  final num avrageRating;
  final bool? isFavourite;
  final String imageFile;
  final List<dynamic> productImages;
  final num calories;
  final Timestamp? createdAt;

  AdvertisingProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.productType,
    required this.avrageRating,
    this.isFavourite =false,
    required this.imageFile,
    required this.productImages,
    required this.calories,
    required this.createdAt,
    required this.productDiscount
  });

  AdvertisingProductEntity toEntity() {
    return AdvertisingProductEntity(
      id: id,
      name: name,
      description: description,
      price: price,
      productType: productType,
      avrageRating: avrageRating,
      isFavourite: isFavourite,
      baseImageUrl: imageFile,
      productImageUrls: productImages,
      calories: calories,
      createdAt: createdAt,
      productDiscount: productDiscount,
    );
  }

  factory AdvertisingProductModel.fromMap(Map<String, dynamic> map) {
    return AdvertisingProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      productType: map['productType'] as String,
      avrageRating: map['avrageRating'] as num,
      isFavourite: map['isFavourite'] as bool,
      imageFile: map['imageFile'] as String,
      productImages: map['productImages'] as List<dynamic>,
      calories: map['calories'] as num,
      createdAt: map['createdAt'] as Timestamp,
      productDiscount: map['productDiscount'] as num,
    );
  }

  factory AdvertisingProductModel.fromProductEntity(AdvertisingProductEntity product) {
    return AdvertisingProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      productDiscount: product.productDiscount,
      price: product.price,
      productType: product.productType,
      avrageRating: product.avrageRating,
      isFavourite: product.isFavourite,
      imageFile: product.baseImageUrl?? 'No Image',
      productImages: product.productImageUrls?? [],
      calories: product.calories,
      createdAt: product.createdAt,
    );
  }
}
