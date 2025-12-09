import 'package:app_delivey_food/features/home/domain/entities/advertising_product_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

AdvertisingProductEntity getDummyAdvertisingProductEntity() =>
    AdvertisingProductEntity(
      id: '1',
      name: 'test',
      description: 'test',
      price: "1",
      productType: 'test',
      avrageRating: 1,
      isFavourite: false,
      baseImageUrl: 'test',
      productImageUrls: ['test'],
      calories: 1,
      createdAt: Timestamp.now(),
      productDiscount: 1,
    );

List<AdvertisingProductEntity> getDummyAdvertisingProductEntities() =>
    List.generate(5, (index) => getDummyAdvertisingProductEntity());
