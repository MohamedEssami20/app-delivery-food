import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../entities/bottom_navigtion_bar_entity.dart';
import '../helper/app_theme_helper.dart';

class BottomNavigationBarItems extends StatelessWidget {
  const BottomNavigationBarItems({
    super.key,
    required this.bottomNavigtionBarEntity,
    required this.isSelected,
  });

  final BottomNavigtionBarEntity bottomNavigtionBarEntity;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: isSelected ? 1.0 : 0.8,
        end: isSelected ? 1.0 : 0.8,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutBack,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale * 1.3,
          child: SvgPicture.asset(
            isSelected
                ? bottomNavigtionBarEntity.activeImage
                : bottomNavigtionBarEntity.inActiveImage,
            colorFilter: ColorFilter.mode(
              isSelected ? theme.colors.primary600 : theme.colors.grey300,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
