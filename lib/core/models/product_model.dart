import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/product_entity.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final String price;
  final int code;
  final int discount;
  final String category;
  final String productType;
  final num avrageRating;
  final bool isFavourite;
  final String imageFile;
  final List<dynamic> productImages;
  final num calories;
  final Timestamp createdAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.discount,
    required this.category,
    required this.productType,
    required this.avrageRating,
    required this.isFavourite,
    required this.imageFile,
    required this.productImages,
    required this.calories,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'discount': discount,
      'category': category,
      'productType': productType,
      'avrageRating': avrageRating,
      'isFavourite': isFavourite,
      'imageFile': imageFile,
      'productImages': productImages,
      'calories': calories,
      'createdAt': createdAt,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      code: map['code'] ?? 0,
      discount: map['discount'] ?? 0,
      category: map['category'] as String,
      productType: map['productType'] as String,
      avrageRating: map['avrageRating'] as num,
      isFavourite: map['isFavourite'] as bool,
      imageFile: map['imageFile'] as String,
      productImages: map['productImages'] as List<dynamic>,
      calories: map['calories'] as num,
      createdAt: map['createdAt'] as Timestamp,
    );
  }

  factory ProductModel.fromProductEntity(ProductEntity product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      code: product.code,
      discount: product.discount,
      category: product.category,
      productType: product.productType,
      avrageRating: product.avrageRating,
      isFavourite: product.isFavourite,
      imageFile: product.baseImageUrl,
      productImages: product.productImageUrls,
      calories: product.calories,
      createdAt: product.createdAt,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      description: description,
      price: price,
      code: code,
      discount: discount,
      category: category,
      productType: productType,
      avrageRating: avrageRating,
      isFavourite: isFavourite,
      baseImageUrl: imageFile,
      productImageUrls: productImages,
      calories: calories,
      createdAt: createdAt,
    );
  }
}
