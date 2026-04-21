class MyOrderEntity {
  final String orderId;
  final String status;
  final String dateOrTimeTitle;
  final String dateOrTimeValue;
  final String summary;
  final double orderTotalPrice;
  final String mainImage;
  final List<dynamic> extraImages;
  final bool isCurrent;

  MyOrderEntity({
    required this.orderId,
    required this.status,
    required this.dateOrTimeTitle,
    required this.dateOrTimeValue,
    required this.summary,
    required this.orderTotalPrice,
    required this.mainImage,
    required this.extraImages,
    required this.isCurrent,
  });
}
