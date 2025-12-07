import 'package:app_delivey_food/features/home/domain/entities/product_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

ProductEntity getDummyProduct(){
  return ProductEntity(
      id: '1',
      name: 'Product 1',
      description: 'Description 1',
      price: '10',
      code: 1,
      productType: 'type 1',
      avrageRating: 4.5,
      isFavourite: true,
      baseImageUrl: 'https://example.com/image.jpg',
      productImageUrls: ['https://example.com/image1.jpg', 'https://example.com/image2.jpg'],
      calories: 200,
      createdAt: Timestamp.now(),
  );
}

List<ProductEntity> getListDummyProduct(){
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}