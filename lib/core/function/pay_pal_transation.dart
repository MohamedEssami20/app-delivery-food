import '../../features/cart/domain/entities/cart_item_entity.dart';

List<dynamic> payPalTransaction({required List<CartItemEntity> cartItems}) {
  final items = cartItems.map((e) {
    final price= double.parse(e.productEntity.price).toStringAsFixed(2);
    return {
      "name": e.productEntity.name,
      "quantity": e.quantity,
      "price": price,
      "currency": "USD",
    };
  }).toList();

  final subtotal = cartItems
      .map((e) => (double.parse(e.productEntity.price)) * e.quantity)
      .reduce((a, b) => a + b)
      .toStringAsFixed(2);
  return [
    {
      "amount": {
        "total": subtotal,
        "currency": "USD",
        "details": {
          "subtotal": subtotal,
          "shipping": "0",
          "shipping_discount": "0",
        },
      },
      "description": "The payment transaction description.",
      "item_list": {"items": items},
    },
  ];
}
