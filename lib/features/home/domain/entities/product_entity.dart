import 'dart:io';

class ProductEntity {
  final String id;
  final String name;
  final String description;
  final String price;
  final int code;
  final String productType;
  final num avrageRating;
  final bool isFavourite;
  final String baseImageUrl;
  final List<String> productImageUrls;
  final num calories;
  final DateTime createdAt;

  ProductEntity({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.productType,
    required this.avrageRating,
    required this.isFavourite,
    required this.calories,
    required this.createdAt,
    required this.baseImageUrl,
    required this.productImageUrls,
  });

  // create copy with function
  ProductEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? price,
    int? code,
    String? productType,
    num? avrageRating,
    bool? isFavourite,
    File? imageFile,
    List<File?>? productImages,
    String? baseImageUrl,
    List<String>? productImageUrls,
    num? calories,
    DateTime? createdAt,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      price: price ?? this.price,
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
