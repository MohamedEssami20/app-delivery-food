import 'dart:io';

import 'package:app_delivey_food/features/home/domain/entities/advertising_product_entity.dart';
class AdvertisingProductModel {
  final String id;
  final String name;
  final String description;
  final String price;
  final num productDiscount;
  final String productType;
  final num avrageRating;
  final bool? isFavourite;
  final File? image;
  final List<File?>? productImagesFile;
  final String imageFile;
  final List<String> productImages;
  final num calories;
  final DateTime? createdAt;

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
    this.image,
    this.productImagesFile, required this.productDiscount,
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
      imageFile: image,
      productImages: productImagesFile,
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
      productImages: map['productImages'] as List<String>,
      calories: map['calories'] as num,
      createdAt: map['createdAt'] as DateTime,
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
      image: product.imageFile,
      productImagesFile: product.productImages,
    );
  }
}
