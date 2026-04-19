class OrderEntity {
  final String id;
  final String status;
  final String dateOrTimeTitle;
  final String dateOrTimeValue;
  final String summary;
  final double totalPrice;
  final String mainImage;
  final List<String> extraImages;
  final bool isCurrent;

  OrderEntity({
    required this.id,
    required this.status,
    required this.dateOrTimeTitle,
    required this.dateOrTimeValue,
    required this.summary,
    required this.totalPrice,
    required this.mainImage,
    required this.extraImages,
    required this.isCurrent,
  });
}
