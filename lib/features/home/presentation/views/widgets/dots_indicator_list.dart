import 'package:flutter/material.dart';

import '../../../../on_borading/presentation/views/widgets/on_boarding_dots_indicator.dart';

class DotsIndicatorList extends StatelessWidget {
  const DotsIndicatorList({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: List.generate(
          3,
          (index) => OnBoardingDotsIndicator(isActive: index == currentIndex),
        ),
      ),
    );
  }
}
