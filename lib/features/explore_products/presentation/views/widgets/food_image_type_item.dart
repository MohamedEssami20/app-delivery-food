import 'package:flutter/material.dart';

class FoodImageTypeItem extends StatelessWidget {
  const FoodImageTypeItem({
    super.key,
    required this.image,
    required this.onTap,
  });

  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(image, fit: BoxFit.fitWidth, width: double.infinity),
    );
  }
}