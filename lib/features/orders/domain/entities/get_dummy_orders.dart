import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/features/orders/domain/entities/order_entity.dart';

List<OrderEntity> getDummyOrders() {
  return [
    OrderEntity(
      id: '1',
      status: 'Out for delivery',
      dateOrTimeTitle: 'Est. delivery',
      dateOrTimeValue: '30mins',
      summary: 'Pepperoni Cheese Pizza',
      totalPrice: 24.02,
      mainImage: Assets.assetsImagesFastFood,
      extraImages: [Assets.assetsImagesBurgerProduct],
      isCurrent: true,
    ),
    OrderEntity(
      id: '2',
      status: 'Order delivered',
      dateOrTimeTitle: 'Delivered on',
      dateOrTimeValue: '26 October',
      summary: 'Pudding x1',
      totalPrice: 16.98,
      mainImage: Assets.assetsImagesDessertFood,
      extraImages: [],
      isCurrent: false,
    ),
    OrderEntity(
      id: '3',
      status: 'Order delivered',
      dateOrTimeTitle: 'Delivered on',
      dateOrTimeValue: '20 October',
      summary: 'Honey Bee Pineapple Cake',
      totalPrice: 26.99,
      mainImage: Assets.assetsImagesDessertFood,
      extraImages: [],
      isCurrent: false,
    ),
    OrderEntity(
      id: '4',
      status: 'Order delivered',
      dateOrTimeTitle: 'Delivered on',
      dateOrTimeValue: '16 October',
      summary: 'Classic Beef Burger x1',
      totalPrice: 18.97,
      mainImage: Assets.assetsImagesBurgerProduct,
      extraImages: [Assets.assetsImagesFastFood],
      isCurrent: false,
    ),
  ];
}
