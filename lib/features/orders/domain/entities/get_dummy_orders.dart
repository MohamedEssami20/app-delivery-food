import 'package:app_delivey_food/core/utils/assets.dart';
import 'package:app_delivey_food/features/orders/domain/entities/my_order_entity.dart';

List<MyOrderEntity> getDummyOrders() {
  return [
    MyOrderEntity(
      orderId: '1',
      status: 'Out for delivery',
      dateOrTimeTitle: 'Est. delivery',
      dateOrTimeValue: '30mins',
      summary: 'Pepperoni Cheese Pizza',
      orderTotalPrice: 24.02,
      mainImage: Assets.assetsImagesFastFood,
      extraImages: [Assets.assetsImagesBurgerProduct],
      isCurrent: true,
    ),
    MyOrderEntity(
      orderId: '2',
      status: 'Order delivered',
      dateOrTimeTitle: 'Delivered on',
      dateOrTimeValue: '26 October',
      summary: 'Pudding x1',
      orderTotalPrice: 16.98,
      mainImage: Assets.assetsImagesDessertFood,
      extraImages: [],
      isCurrent: false,
    ),
    MyOrderEntity(
      orderId: '3',
      status: 'Order delivered',
      dateOrTimeTitle: 'Delivered on',
      dateOrTimeValue: '20 October',
      summary: 'Honey Bee Pineapple Cake',
      orderTotalPrice: 26.99,
      mainImage: Assets.assetsImagesDessertFood,
      extraImages: [],
      isCurrent: false,
    ),
    MyOrderEntity(
      orderId: '4',
      status: 'Order delivered',
      dateOrTimeTitle: 'Delivered on',
      dateOrTimeValue: '16 October',
      summary: 'Classic Beef Burger x1',
      orderTotalPrice: 18.97,
      mainImage: Assets.assetsImagesBurgerProduct,
      extraImages: [Assets.assetsImagesFastFood],
      isCurrent: false,
    ),
  ];
}
